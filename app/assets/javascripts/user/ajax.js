function submitInterestAjax(){
    $.ajax({
        url: '/userinfo',
        headers: {
            Accept: "text/javascript; charset=utf-8",
            "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        type: 'PATCH',
        data:  $('#interest').serialize(),
    });
}

function submitPreferenceAjax(){
    $.ajax({
        url: '/userinfo',
        headers: {
            Accept: "text/javascript; charset=utf-8",
            "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
        },
        type: 'PATCH',
        data:  $('#preference').serialize(),
    });
}