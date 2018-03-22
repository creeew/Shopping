function login()
{
  $(".ui.form").form(
    {
      username: {
        identifier: 'usrname',
        rules: [
          {
            type: 'regExp',
            value: /^[a-zA-Z0-9_-]{4,16}$/,
            prompt: 'Login Fails'
          }]
        },
       userpass: {
            identifier: 'pwd',
            rules: [
              {
                type   : 'empty',
                prompt : 'Login Fails'
              },
              {
                type   : 'length[6]',
                prompt : 'Login Fails'
              }
            ]
          }
            },
            {

            }
          );
        }
