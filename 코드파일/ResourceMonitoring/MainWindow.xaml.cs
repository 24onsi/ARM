using LiveCharts.Wpf;
using MySql.Data.MySqlClient;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;
using Google.Protobuf.WellKnownTypes;
using LiveCharts;
using System.Runtime.CompilerServices;
using System.Collections.Concurrent;
using static System.Net.Mime.MediaTypeNames;
using System.Threading;
using System.Windows.Threading;
using System;
using Microsoft.Win32;

namespace ResourceMonitoring
{
    public partial class MainWindow : Window
    {
        private System.Timers.Timer DB_timer;

        private System.Timers.Timer Error_timer;

        private CPULineChart cpuchartUpdate;
        private static double cpuValue { get; set; }
        private static double memValue { get; set; }
        private static double diskValue { get; set; }
        public MainWindow()
        {
            InitializeComponent();

            cpuchartUpdate = new CPULineChart();
            DataContext = cpuchartUpdate;

            Thread DBthread = new Thread(new ThreadStart(BackThread));
            DBthread.IsBackground = true;
            DBthread.Start();
        }

        public void UI_Start()
        {
            CpuChartValue();

            MemoryChartValue();

            DiskChartValue();
        }

        public void CpuChartValue()
        {
            Task.Run(async() =>
            {
                while (true)
                {
                    cpuValue = Math.Ceiling(GetCpuValue());

                    await Dispatcher.BeginInvoke(new Action(() =>
                    {
                        cpu_graph.Value = cpuValue;
                        cpuchartUpdate.CpuValues.Add(cpuValue);
                        if (cpuchartUpdate.CpuValues.Count > 20)
                            cpuchartUpdate.CpuValues.RemoveAt(0);
                    }));
                    await Task.Delay(1000);
                }
            });
        }

        public void MemoryChartValue()
        {
            Task.Run(async() =>
            {
                while (true)
                {
                    memValue = Math.Ceiling(GetMemValue());

                    await Dispatcher.BeginInvoke(new Action(() =>
                    {
                        memory_graph.Value = memValue;
                    }));
                    await Task.Delay(1000);
                }
            });
        }

        public void DiskChartValue()
        {
            Task.Run(async() =>
            {
                while (true)
                {
                    diskValue = Math.Ceiling(GetDiskValue());

                    await Dispatcher.BeginInvoke(new Action(() =>
                    {
                        disk_graph.Value = diskValue;
                    }));
                    await Task.Delay(1000);
                }
            });
        }

        public static double GetCpuValue()
        {
            var CpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
            CpuCounter.NextValue();
            System.Threading.Thread.Sleep(1000);
            double returnvalue = (double)CpuCounter.NextValue();

            return returnvalue;
        }

        public static double GetMemValue()
        {
            var MemCounter = new PerformanceCounter("Memory", "% Committed Bytes in Use");
            double returnvalue = (double)MemCounter.NextValue();

            return returnvalue;
        }

        public static double GetDiskValue()
        {
            {
                double TotalDiskSize = 0;
                double AvailableDiskSize = 0;
                double UsedDiskSize = 0;
                double UsedDiskSizePercent = 0;
                DriveInfo[] drives = DriveInfo.GetDrives();

                foreach (DriveInfo drive in drives)
                {
                    if (drive.IsReady)
                    {
                        TotalDiskSize += drive.TotalSize;
                        AvailableDiskSize += drive.AvailableFreeSpace;
                    }
                }
                UsedDiskSize = TotalDiskSize - AvailableDiskSize;
                UsedDiskSizePercent = (UsedDiskSize / TotalDiskSize) * 100;

                return UsedDiskSizePercent;
            }
        }

        public void BackThread()
        {
            DB_timer = new System.Timers.Timer();
            DB_timer.Interval = 60000;
            DB_timer.Elapsed += InsertDB;
            DB_timer.AutoReset = true;
            DB_timer.Enabled = true;

            Error_timer = new System.Timers.Timer();
            Error_timer.Interval = 5000;
            Error_timer.Elapsed += ErrorCheck;
            Error_timer.AutoReset = true;
            Error_timer.Enabled = true;
        }

        public void InsertDB(Object source, System.Timers.ElapsedEventArgs e)
        {
            MySqlConnection conn;
            string connectString = "Server=127.0.0.1;Port=3306;Database=monitoring;Uid=sion;Pwd=1234;CharSet=utf8;";

            try
            {
                conn = new MySqlConnection(connectString);
                conn.Open();
                conn.Ping();
                string cpu = Math.Round(cpuValue).ToString();
                string mem = Math.Round(memValue).ToString();
                string disk = Math.Round(diskValue).ToString();

                if (cpu == "0" || mem == "0" || disk == "0")
                {
                    conn.Close();
                }
                else
                {
                    string query = "INSERT INTO RESOURCE VALUES(DEFAULT," + cpu + "," + mem + "," + disk + ");";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btn_exit_Click(object sender, RoutedEventArgs e)
        {
            Window.GetWindow(this).Close();
        }

        private void btn_search_Click(object sender, RoutedEventArgs e)
        {
            search SearchWindow = new search();
            SearchWindow.Show();
        }

        private void btn_start_Click(object sender, RoutedEventArgs e)
        {
            UI_Start();
        }

        public void ErrorCheck(Object source, System.Timers.ElapsedEventArgs e)
        {
            string cpu = Math.Round(cpuValue).ToString();
            string mem = Math.Round(memValue).ToString();
            string disk = Math.Round(diskValue).ToString();

            if (cpu == "0" || mem == "0" || disk == "0")
            {
                ErrorFileCreate(cpu, mem, disk);
            }
        }

        public void ErrorFileCreate(string error_cpu, string error_mem, string error_disk)
        {
            try
            {
                string time_error = DateTime.Now.ToString("yyyy년MM월dd일HH시mm분ss초");
                string CreateFile = @"C:\Users\uy122\OneDrive\바탕 화면\ErrorFile\errorfile" + time_error + ".txt";
                StreamWriter textWrite = File.CreateText(CreateFile);

                string time = "시간 : " + time_error;
                string cpu_error = "\nCPU 사용량 : " + error_cpu;
                string memory_error = "\n메모리 사용량 : " + error_mem;
                string disk_error = "\n디스크 사용량 : " + error_disk;
                string write_text = time + cpu_error + memory_error + disk_error;

                textWrite.WriteLine(write_text); //쓰기
                textWrite.Dispose(); //파일 닫기
            }
            catch(Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
        }
    }


    public class CPULineChart : INotifyPropertyChanged
    {
        private ChartValues<double> _cpuValues;

        public ChartValues<double> CpuValues
        {
            get { return _cpuValues; }
            set
            {
                _cpuValues = value;
                OnPropertyChanged();
            }
        }

        public CPULineChart()
        {
            _cpuValues = new ChartValues<double>();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}