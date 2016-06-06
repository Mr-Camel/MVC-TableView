# MVC-TableView

MVC-TableView主要作用于解耦以往的ViewController		
在实际开发中, 经常遇到这样的状况:		
在Controller中拥有一个TableView, TableView的Delegate和DataSource交付给Controller, 
同时Controller还要负责下拉刷新和上拉加载的网络请求, 这些代码永远的相似, 但是却耦合在Controller中无法重用, 扩展起来也相当麻烦.		
所以, 我们要将创建Model层去处理TableView数据源方法, 以及一个网络层去处理网络请求, 从而实现Controller的解耦.

