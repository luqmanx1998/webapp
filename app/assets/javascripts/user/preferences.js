$('#hide_nsfw').bind('change', function() {
    $.ajax({
        url: '/userinfo',
        headers: {
            Accept: "text/javascript; charset=utf-8",
            "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        type: 'PATCH',
        data: {
            "user": {
                "hide_nsfw": this.checked
            }
        }
    });
});

