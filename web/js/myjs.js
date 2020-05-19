function doLike(pid, uid)
{

    console.log(pid + "," + uid)
    const d = {
        pid: pid,
        uid: uid,
        operation: 'Like'
    }
    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == 'true') {
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
            }
            else{
              let c = $(".like-counter").html();
                c--;
                $(".like-counter").html(c);  
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    })
}


function showComment(i)
{
    var value;
    if (i == 0) {
        value='block'
        
    }
    else{
        value='none'
    }
    (document).getElementById('fbComment').style.display = value;
}