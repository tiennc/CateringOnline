	//Ham kiem tra du lieu nhap vao form
	function checkForm()
	{
		//alert('Thuc hien check form');
		//Kiem tra du lieu nhap vao
		
		//Lay du lieu tu form
		var username = document.frmlogin.txt_username.value;
		var pass = document.frmlogin.txt_pass.value;
		
		if(username == "")
		{
			alert("Mời bạn hãy nhập tài khoản");
			//document.getElementById("user_err").innerHTML = "Nhap username";
			document.frmlogin.txt_username.focus();
			return false;
		}
		else
		{
				if(pass == "")
				{
					alert("Mời bạn nhập mật khẩu");
					document.frmlogin.txt_pass.focus();
					return false;
				}
				else
					return true;
			return true;
		}
		/*if(username != "" && pass != "")
			return true;
		else
			return false;*/
	}