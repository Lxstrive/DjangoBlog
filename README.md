# DjangoBlog

python 2.7 
1. 先安装mysql
   安装的时候需要密码设置为123456
   或者在settings.py中配置自己的sql数据库密码

2. 新建数据库 库名为blogmysql
    导入 blogmysql.sql文件
    可以通过 navicat数据库可视化工具 导入sql文件

3. pip install -r requirements.txt 安装依赖包
4. pip install MySQL-python 已经有了 可以忽略这条
    如果安装失败  可以通过http://www.lfd.uci.edu/~gohlke/pythonlibs/#mysql-python 下载 MySQL_python-1.2.5-cp27-none-win_amd64.whl
    然后pip install MySQL_python-1.2.5-cp27-none-win_amd64.whl 安装mysqldb驱动
   
5.  python manage.py runserver

6.  浏览器中输入 127.0.0.1:8000访问
   
7.  登录名 lianxi 密码 lianxi123
    
8.  注册用户

9.  鼠标移动到首页右边 黑边处点击修改资料 个人头像
