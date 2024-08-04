using Google.Protobuf.WellKnownTypes;
using LiveCharts;
using LiveCharts.Wpf;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Security.RightsManagement;
using System.Windows;
using System.Windows.Controls;

namespace ResourceMonitoring
{
    public partial class search : Window
    {
        public static List<string> DateTimeList = new List<string>();
        public SeriesCollection SeriesData { get; private set; }
        public List<string> XLabel { get; set; }
        public Func<int, string> Values { get; set; }
        public ListView ListDate { get; set; }

        public search()
        {
            InitializeComponent();
            ComboListInit();
        }

        public void createLinechart()
        {
            SeriesData = new SeriesCollection
            {
                new LineSeries
                {
                    Title = "CPU 사용량",
                    Values = new ChartValues<int>()
                },
                new LineSeries
                {
                    Title = "Memory 사용량",
                    Values = new ChartValues<int>()
                },
                new LineSeries
                {
                    Title = "Disk 사용량",
                    Values = new ChartValues<int>()
                }
            };

            SearchChart.Series = SeriesData;
            XLabel = new List<string>();
            Values = value => value.ToString("N");
            DataContext = this;
        }

        public string SearchDateTime { get; set; } 
        public async Task ComboListInit()
        {
            try
            {
                MySqlConnection conn1
            = new MySqlConnection("Server=127.0.0.1;Port=3306;Database=monitoring;Uid=sion;Pwd=1234;CharSet=utf8;");
                conn1.Open();
                conn1.Ping();

                string query = "SELECT LEFT(TIME, 13) FROM RESOURCE WHERE TIME GROUP BY LEFT(TIME, 13);";

                MySqlCommand cmd = new MySqlCommand(query, conn1);
                MySqlDataReader? dr = cmd.ExecuteReader();

                DateTimeList.Clear();

                while (await dr.ReadAsync())
                {
                    DateTimeList.Add($"{(dr[0].ToString())}시");
                }

                dr.Close();
                conn1.Close();

                await Dispatcher.BeginInvoke(() =>
                {
                    time_combo.ItemsSource = DateTimeList;
                });
            }
            catch (Exception ex)
            {
                Console.WriteLine("쿼리 오류: " + ex.Message);
            }
        }

        public async Task SearchData(string date)
        {
            SearchDateTime = date;
            date = date.Remove(13);
            try
            {
                MySqlConnection conn2
            = new MySqlConnection("Server=127.0.0.1;Port=3306;Database=monitoring;Uid=sion;Pwd=1234;CharSet=utf8;");
                conn2.Open();
                conn2.Ping();

                string query = $"SELECT * FROM RESOURCE WHERE TIME LIKE '{date}%' ORDER BY TIME;";

                MySqlCommand cmd = new MySqlCommand(query, conn2);
                MySqlDataReader? dr = cmd.ExecuteReader();

                await Dispatcher.BeginInvoke(() =>
                {
                    SeriesData[0].Values.Clear();
                    SeriesData[1].Values.Clear();
                    SeriesData[2].Values.Clear();
                    SearchChart.AxisX.Clear();

                    XLabel.Clear();
                });

                while (await dr.ReadAsync())
                {
                    string SearchDate = dr[0].ToString();
                    SearchDate = SearchDate.Substring(14);

                    await Dispatcher.BeginInvoke(() =>
                    {
                        XLabel.Add(SearchDate);
                        SeriesData[0].Values.Add(Convert.ToInt32(dr[1]));
                        SeriesData[1].Values.Add(Convert.ToInt32(dr[2]));
                        SeriesData[2].Values.Add(Convert.ToInt32(dr[3]));
                    });
                }

                await Dispatcher.BeginInvoke(() =>
                {
                    
                    SearchChart.AxisX.Add(new Axis
                    {
                        Title = "시간대",
                        Labels = XLabel
                    });
                });

                dr.Close();
                conn2.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("쿼리 오류: " + ex.Message);
            }
        }

        public async void btn_result_Click(object sender, RoutedEventArgs e)
        {
            if (time_combo.SelectedItem != null)
            {
                string date = time_combo.SelectedItem.ToString();
                lbl_date.Content = date + " 리소스 모니터링 데이터 검색";
                createLinechart();
                await SearchData(date);
            }
        }
    }
}