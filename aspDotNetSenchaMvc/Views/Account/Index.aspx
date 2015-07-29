<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Index</title>
     <script type="text/javascript" charset="utf-8">
          var loginURL = '<%= Url.Action("LogOn", "Account")%>';
         //var loginURL = 'http://192.168.1.11:11572/Account/LogOn';
    </script>
              <!-- <script src="lib/touch/sencha-touch.js" type="text/javascript"></script>-->
         <link href="http://cdn.sencha.io/touch/1.1.0/resources/css/sencha-touch.css" rel="stylesheet" type="text/css" media="screen"/>
  

  <script src="http://cdn.sencha.io/touch/1.1.0/sencha-touch.js" type="text/javascript"></script>
      <script language="javascript" type="text/javascript">


      var doLogin = function()
                {
                Ext.Msg.alert("Inside"+loginURL);
                //display Loading indicator to user
                //mainPanel.setLoading(true, false);

//                Ext.Ajax.request({
//                url: loginURL,
//                method: 'post',
//                params: {UserName: Ext.getCmp('Username').getValue(), Password : Ext.getCmp('Password').getValue()},
//                failure : function(response){
//                data = Ext.decode(response.responseText);
//                Ext.Msg.alert("Login Error" + loginURL, data.errorMessage, Ext.emptyFn);
//                },
//                success: function(response, opts) {
//                data = Ext.decode(response.responseText);
//                if (data.errorMessage != null)
//                {
//                Ext.Msg.alert("Login Error", data.errorMessage, Ext.emptyFn);
//                //mainPanel.setLoading(false);
//                } else {
//                //hide the Loading mask
//                //mainPanel.setLoading(false);
//                //show the next screen
//                Ext.Msg.alert(data.responseText + loginURL);
//                }
//                }
                //                });

                Ext.util.JSONP.request({
                    url: loginURL,
                    callbackKey: 'callback',
                    params: { UserName: Ext.getCmp('Username').getValue(), Password: Ext.getCmp('Password').getValue() },
                    timeout : 50000,
                    callback: function (data) {
                        if (data.errorMessage != null)
                            {
                            Ext.Msg.alert("Login Error", data.errorMessage, Ext.emptyFn);
                            //mainPanel.setLoading(false);
                            } else {
                            //hide the Loading mask
                            //mainPanel.setLoading(false);
                            //show the next screen
                            Ext.Msg.alert(data.responseText + loginURL);
                            }
                                       

                        
                    }
                });
        }
      var loginForm = new Ext.form.FormPanel({
                dockedItems:[{
                xtype: 'toolbar',
                title: 'Login Form',
                ui: 'light'
                }],
                items: [{
                xtype: 'fieldset',
                id: 'loginFormSet',
                title: '',
                items: [
                {
                xtype: 'emailfield',
                placeHolder: 'Username',
                name: 'Username',
                id: 'Username',
                required: true
                }, {
                xtype: 'passwordfield',
                placeHolder: 'Password',
                name: 'Password',
                required: true
                }, {
                xtype: 'checkboxfield',
                id: 'RememberMe',
                name: 'RememberMe',
                label: 'Save login?',
                labelWidth: '40%'
                },
                {
                xtype: 'button',
                text: 'Login',
                ui: 'confirm',
                style: 'margin:2%;',
                handler: function() {
                doLogin();
                }
                }
                ]
                }]
                            });


                            //login card
                            var loginCard = [{
    xtype: 'panel',
    items: [{
        title: 'Login',
        xtype: 'form',
        fullscreen: true,
        id: 'loginForm',
        scroll: 'vertical',
        items: [{
            xtype: 'fieldset',
            title: 'Login Info',
            instructions: 'Please enter the information below.',
            defaults: {
                // labelAlign: 'right'
                labelWidth: '35%'
                }
            }, {
                    xtype: 'textfield',
                    name: 'Username',
                    id: 'Username',
                    label: 'Name',
                    autoCapitalize : true,
                    required: true,
                    useClearIcon: true
            }, {
                    xtype: 'passwordfield',
                    name: 'Password',
                    id: 'Password',
                    label: 'Password',
                    useClearIcon: true
                },{
                    layout: 'vbox',
                    defaults: {xtype: 'button', flex: 1, style: 'margin: .5em;'},
                    items: [{
                            text: 'Login',
                            scope: this,
                      handler: function() {
                                                doLogin();
                                           }
                            },
                            ]
                }]
            }]
}]

                                    // entry point of application
new Ext.Application({
    name: "KurtzaceNestedList",
    launch: function() {
/*        this.views.viewport = new this.views.Viewport();*/

        var mainPanle = new Ext.Panel({
                        id: 'mainPanel',
                        fullscreen: true,                        
                        layout: 'card',
                        iconCls: 'compose',
                        items: [loginCard]
        });

    }
});


      </script>
              <!--<link href="/lib/touch/resources/css/sencha-touch.css" rel="stylesheet" type="text/css" />-->
              
   

</head>
<body>
    <div>
    
    </div>
</body>
</html>
