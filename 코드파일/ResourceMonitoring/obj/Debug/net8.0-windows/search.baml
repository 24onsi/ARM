   M S B A M L   `   `   `  ����M  IResourceMonitoring, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ResourceMonitoringResourceMonitoring  5      U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5          ResourceMonitoring.search   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ResourceMonitoring     5      Dlvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf     5        � Title$  search��5	      $	��899��6   $	��595��6"   .��5      � 
�������$��0,0,0,-5q�6#   .+�5   
   �� $��67��6   $��450,26,37,0q�6    $	��Top=�65    �� RadiusX$ 10��6M    �� RadiusY$ 10��6Z   ���	#FFDEDCD16g   �� 5   
   $	��435��6   $��
29,114,0,0q�6!   $	��Top=�65   $ 10��6M   $ 10��6Z   ���	#FFDEDCD1$
��Left=�6x   $	��833��6�   �� 5   
   $��67��6   $��29,26,458,0q�6    $	��Top=�65   $ 10��6M   $ 10��6Z   ���	#FFDEDCD16g   �� 5   
   -   5         ��Name$ 
btn_result��5   5   $	��159��6   $	��Top=�6   $��
260,38,0,0q�6I   $��44��6]   $
��Left=�6i   $��SEARCH��6�   $��1.5,1.5,1.5,1.5q�6�   
�������$
��Bold"�6�   ���	#FF797979$��18(�6#  ��6�   Z�  � 	Resources 5       �� 
TargetType �� Property �� Value��%^   '��       �� 5      " ��6   .�5      ��  �@��CornerRadius$ 5��65   5      5      5      �� 5   
   -   5         ��Name$ 
time_combo��5      $
��Left=�6'   $��	47,37,0,0q�6B   $	��Top=�6U   $	��208��6m   $��45��6y   
�������
�������$��Center=�6�   $��15(�6�   $
��Bold"�6�   $��Center=�6�   ���	#FF7979796  #  LiveCharts.Wpf.CartesianChart  5   
   -   5        	  Name$	 SearchChart��5   *   $��0��6   $
��Left=�6?   $	��Top=�6Z   $��
46,137,0,0q�6r   $	��404��6�   $	��790��6�   &   LiveCharts.Wpf.Charts.Base.Chart
   AxisX
 5        LiveCharts.Wpf.Axis     Title$ 	시간대��6      
Foreground �	#FF797979   Labels 6'   �� *XLabel+   	Separator 5        LiveCharts.Wpf.Separator  5         Step$ 1Q�6(   5!         AxisY 5$           MinValue$ 0Q�6      MaxValue$	 100Q�6(     5&      $ 	사용량��6    �	#FF797979   LabelFormatter 6'   �� *Values+ 5(        5)      $ 5Q�6(   5+         Series 5/        LiveCharts.Wpf.LineSeries    LiveCharts.Wpf.Series   Title$ CPU 사용량��6!      PointGeometrySize$ 5Q�6K      Stroke �	#FFED7756   Values 61   �� *Values+   Fill 50      �� 51       �� Color$ 	#FFE8552C��6*    �� Opacity$	 0.8Q�6<   53        54      $ Memory 사용량��6!   $ 5Q�6N    64   �� *Values+ 55      �� 56      $ 	#FFADC6BD��6*   $	 0.9Q�6<   58        59      $ Disk 사용량��6!   $ 5Q�6L    62   �� *Values+ 5:      �� 5;      $ 	#FFD0857B��6*   $	 0.9Q�6<   5=      5A      �� 5B   
   -   5         ��Name$ lbl_date��5B      $�� ��6"   $
��Left=�6-   $��
463,38,0,0q�6H   $	��Top=�6\   $	��384��6t   $��43��6�   $��1,1,1,1q�6�   $��Center=�6�   $��Center=�6�   $��17(�6�   $
��Bold"�6�   ���	#FF3F3F3F6  5D      5E      