##Design

- Add a drawer to a screen 为你的界面添加抽屉

		/*
		**Scaffold.of(context)的使用条件
		*/
		//脚手架下直接添加抽屉即可,open如下所示,但是注意 does not contain Scaffold错误
		Scaffold.of(context).openDrawer();
	
- 添加snackBar display a snackBar

		/*
		**Scaffold.of(context)的使用条件,与drawer使用方式相似
		*/
		//脚手架下直接添加抽屉即可,show如下所示,但是注意 does not contain Scaffold错误
		SnackBar snackBar = SnackBar(
	      content: Text(
	          "Yay! A SnackBar"
	      ),
	      action: SnackBarAction(
	          label: "I'm a label ",
	          onPressed: () {
	            //do something
	          }
	      ),
	    );
		Scaffold.of(context).showSnackBar(snackBar);

##Navigation
- 如何跳转页面,API像是一种栈结构

		/*Navigator.push();
		**Navigator.pop();
		*/
		Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return 跳转页面实例();
              })
          );