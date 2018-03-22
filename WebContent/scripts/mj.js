function login()
{
  $(".ui.form").form(
    {
      username: {
        identifier: 'username',
        rules: [
          {
            type: 'regExp',
            value: /^[a-zA-Z0-9_-]{4,16}$/,
            prompt: 'Please enter 4 to 6 letter or underline'
          }]
        },
        checkbox: {
          identifier  : 'checkbox',
          rules: [
            {
              type   : 'checked',
              prompt : 'Please check the checkbox'
            }]
          },
          userpass: {
            identifier: 'pwd',
            rules: [
              {
                type   : 'empty',
                prompt : 'Please enter a password'
              },
              {
                type   : 'length[6]',
                prompt : 'Your password must be at least 6 characters'
              }
            ]
          },
            userpass1: {
              identifier: 'pwd1',
              rules: [
                {
                  type: 'match[pwd]',
                  prompt : 'Please enter the same password'
                }]
              },
              phone: {
                identifier: 'phone',
                rules: [
                  {
                    type: 'regExp',
                    value:  /(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/,
                    // type: 'empty',
                    // prompt: 'Please enter a valid phone number'
                  }
                ]
              },
              address: {
                identifier: 'addr',
                rules: [
                  {
                    type: 'minLength[10]',
                    prompt: 'Please enter at least 10 characters'
                    // type: 'empty',
                    // prompt: 'Emptyyyyy'
                  }
                ]
              }
            },
            {
              onSuccess: function () {
                alert("Success");
              }
            }
          );
        }
