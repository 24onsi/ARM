   M S B A M L   `   `   `  ����M  IResourceMonitoring, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ResourceMonitoringResourceMonitoring  5   	   U QLiveCharts.Wpf, Version=0.9.7.0, Culture=neutral, PublicKeyToken=0bc1f845d1ebb8dfG4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.WpfLiveCharts.Wpf 5   	   #    ResourceMonitoring.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:ResourceMonitoring     5   	   Dlvc4clr-namespace:LiveCharts.Wpf;assembly=LiveCharts.Wpf     5   	     � Title$  
MainWindow��5	   	   $	��657��6   $
��1075��6)   .��5      � 
������� � RowDefinitions 5   
   �� 5      $
��1075 �6   �� 5      $	��657 �6   .+�5   
   �� $
��Left=�6   $	��236��6/   $	��Top=�6<   $	��365��6T   $��
281,40,0,0q�6`    �� RadiusX$ 10��6t    �� RadiusY$ 10��6�   ���	#FFDEDCD16�   �� 5   
   $
��Left=�6   $	��236��6/   $	��Top=�6<   $	��365��6T   $��
681,40,0,0q�6`   $ 10��6t   $ 10��6�   ���	#FFDEDCD16�   �� 5   
   $��Center=�6   $	��289��61   $	��Top=�6>   $
��1026��6V   $��	0,297,0,0q�6c   $ 10��6v   $ 10��6�   ���	#FFDEDCD16�   �� 5   
   -   5         ��Name$ 
btn_search��5   5   $	��200��6   $	��Top=�6   $��
28,128,0,0q�6I   $��50��6]   $
��Left=�6i   $��SEARCH��6�   $��1.5,1.5,1.5,1.5q�6�   
�������$
��Bold"�6�   ���	#FF797979$��20(�6#  ��6�   Z�  � 	Resources 5       �� 
TargetType �� Property �� Value��%^   '��       �� 5      " ��6   .�5      ��  �@��CornerRadius$ 5��65   5      5       5!      �� 5#   
   -   5        	 ��Name$		 cpu��5#      $	��CPU��6   $
��Left=�6+   $��
28,303,0,0q�6F   $	��Top=�6Z   $	��129��6r   $��Center=�6~   $
��Bold"�6�   $��50��6�   $��Center=�6�   $��25(�6�   ���	#FF7979796�   �� 5$   
   -   5        $	 memory��5$      $��Memory��6    $
��Left=�61   $��
703,41,0,0q�6L   $	��Top=�6`   $	��129��6x   
 J� RenderTransformOrigin$
 0.036,-0.082&�6�   $��Center=�6�   $
��Bold"�6�   $��50��6�   $��Center=�6�   $��25(�6  ���	#FF7979796  �� 5%   
   -   5        $
	 disk��5%      $
��Disk��6   $
��Left=�6-   $��
285,40,0,0q�6H   $	��Top=�6\   $	��129��6t   $
 0.036,-0.082&�6�   $��Center=�6�   $
��Bold"�6�   $��50��6�   $��Center=�6�   $��25(�6	  ���	#FF7979796  �� 5&   
   -   5        $ btn_exit��5&   5   $	��200��6   $	��Top=�6   $��
28,201,0,0q�6G   $��50��6[   $
��Left=�6g   $
��EXIT��6�   $��1.5,1.5,1.5,1.5q�6�   
�������$
��Bold"�6�   ���	#FF797979$��20(�6  ��6�   Z�  5'      ��%^   '��       �� 5(      " ��6   .�5)      ��  �@��CornerRadius$ 5��65   5*      5+      5,      �� 5-   
   -   5        $ 	btn_start��5-   5   $	��200��6   $	��Top=�6   $��	28,52,0,0q�6H   $��50��6[   $
��Left=�6g   $��START��6�   $��1.5,1.5,1.5,1.5q�6�   
�������$
��Bold"�6�   ���	#FF797979$��20(�6  ��6�   Z�  5.      ��%^   '��       �� 5/      " ��6   .�50      ��  �@��CornerRadius$ 5��65   51      52      53      #  LiveCharts.Wpf.CartesianChart  54   
   -   5          Name$ resourceChart��54   *   $��0��6   $��338,324,37,490q�6A   $	��700��6Y   
�������&   LiveCharts.Wpf.Charts.Base.Chart   Series 58        LiveCharts.Wpf.LineSeries    LiveCharts.Wpf.Series   Title$	 CPU��6!      PointGeometrySize$ 5Q�6J      Stroke �	#FFADC6BD   PointForeground �	#FF797979   Values 6-   �� *	CpuValues+   Fill 59      �� 5:       �� Color$ 	#FF819E94��6*    �� Opacity$ 0.905Q�6<   5<      5@        LiveCharts.Wpf.Gauge  5B   
   -   5          Name$ 	cpu_graph��5B      $��0��6'   $��6,369,712,515q�67      From$ 0Q�5C      	   To$	 100Q�6   $	��170��6&      Stroke
 �����   ToColor$ 	#FFCB5E3F��6B      	FromColor$ 	#FFCB5E3F��6V   ���	#FF797979   GaugeBackground 5D      �� 5E      $ 	#FFD0857B��6"   $	 0.5Q�64   5G        5H   
   -	   5        $ memory_graph��5H      $��0��6*   $��685,82,33,821q�6:   $ 0Q�5I      $	 100Q�6   $	��357��6   $	��172��6+   $ 	#FFCB5E3F��68   $ 	#FFCB5E3F��6N   ���	#FF797979 5J      �� 5K      $ 	#FFD0857B��6"   $	 0.5Q�64   5M        5N   
   -
   5        $ 
disk_graph��5N      $��0��6(   $��285,84,433,821q�68   $ 0Q�5O      $	 100Q�6   $	��357��6   $	��170��6+   $ 	#FFCB5E3F��68   $ 	#FFCB5E3F��6N   ���	#FF797979 5P      �� 5Q      $ 	#FFD0857B��6"   $	 0.5Q�64   5S      5V      5W      