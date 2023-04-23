

let isEdit = false;
function updateProfile(parameters) {
    if (isEdit) {
        $('#update-profile').hide();
        $('#view-profile').show();
        $('#updatebtn').text("Update Profile");

        isEdit = false;
    } else {
        $('#update-profile').show();
        $('#view-profile').hide();
        $('#updatebtn').text("Return");

        isEdit = true;
    }
}
//$(document).ready(function () {
//    $('#updatebtn').click(function () {
//        if (isEdit) {
//            $('#update-profile').hide();
//            $('#view-profile').show();
//            $('#updatebtn').text("Update Profile");
//
//            isEdit = false;
//        } else {
//            $('#update-profile').show();
//            $('#view-profile').hide();
//            $('#updatebtn').text("Return");
//
//            isEdit = true;
//        }
//    });
//});



//login js

//function login() {
//
//    event.preventDefault();
//    let form = new FormData(this);
//
//    $.ajax({
//        url: "LoginServlet",
//        type: 'POST',
//        data: form,
//        success: function (data, textStatus, jqXHR) {
//            console.log(data);
//
//            if (data == 'done') {
//                swal("Login Successfully !!", "We are redirecting to profile page", "success", {
//                    buttons: false,
//                    timer: 2000
//                }).then(() => {
//                    window.location = 'index.jsp';
//                });
//            } else {
//                swal(data, "", "error");
//            }
//
//        },
//        error: function (jqXHR, textStatus, errorThrown) {
//            console.log(jqXHR);
//        },
//        processData: false,
//        contentType: false
//
//    });
//
//
//}
//$(document).ready(function () {
//    console.log("loadded");
//    $('#login-form').on('submit', function () {
//        event.preventDefault();
//        let form = new FormData(this);
//
//        $.ajax({
//            url: "LoginServlet",
//            type: 'POST',
//            data: form,
//            success: function (data, textStatus, jqXHR) {
//                console.log(data);
//
//                if (data == 'done') {
//                    swal("Login Successfully !!", "We are redirecting to profile page", "success", {
//                        buttons: false,
//                        timer: 2000
//                    }).then(() => {
//                        window.location = 'index.jsp';
//                    });
//                } else {
//                    swal(data, "", "error");
//                }
//
//            },
//            error: function (jqXHR, textStatus, errorThrown) {
//                console.log(jqXHR);
//            },
//            processData: false,
//            contentType: false
//
//        });
//
//    });
//
//
//});



//register js

function register() {
    event.preventDefault();
    let form = new FormData(this);

    $.ajax({
        url: "RegistrationServlet",
        type: 'POST',
        data: form,
        success: function (data, textStatus, jqXHR) {
            console.log(data);

            if (data === 'done') {
//                                swal("Account created successfully ..we are redirecting to login page")
                swal("Account created successfully!", "we are redirecting to login page!", "success")
                        .then((value) => {
                            window.location = 'login.jsp';
                        });
            } else {
                swal(data, "", "info");
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        },
        processData: false,
        contentType: false

    });
}

//$(document).ready(function () {
//    console.log("loadded");
//    $('#reg-form').on('submit', function () {
//        event.preventDefault();
//        let form = new FormData(this);
//
//        $.ajax({
//            url: "RegistrationServlet",
//            type: 'POST',
//            data: form,
//            success: function (data, textStatus, jqXHR) {
//                console.log(data);
//
//                if (data === 'done') {
////                                swal("Account created successfully ..we are redirecting to login page")
//                    swal("Account created successfully!", "we are redirecting to login page!", "success")
//                            .then((value) => {
//                                window.location = 'login.jsp';
//                            });
//                } else {
//                    swal(data, "", "info");
//                }
//
//            },
//            error: function (jqXHR, textStatus, errorThrown) {
//                console.log(jqXHR);
//            },
//            processData: false,
//            contentType: false
//
//        });
//
//    });
//
//
//});


//like


//
//        <script>
            
//            function makeLike(pId,ref) {//
//
//                $.ajax({
//                    url: "LikeServlet",
//                    data: {pId: pId},
//                    success: function (data, textStatus, jqXHR) {
//                    console.log(data);
//                    if(data=="liked"){
//                    let c = $(ref).text();
//                    c++;
//                    $(ref).html('<i class="fa fa-thumbs-up me-2"></i>'+c);
//                    }else if(data=="removed-like"){
//                    let c = $(ref).text();
//                    c--;
//                    $(ref).html('<i class="fa fa-thumbs-o-up me-2"></i>'+c);
//                    }
//                    else if(data=="not-login"){
//                        alert("Please login")
//                    }else{
//                        alert(data)
//                    }
//                    },
//                    error: function (jqXHR, textStatus, errorThrown) {
//
//                    }
//
//                    });
//
//
//                    }
        //</script>




