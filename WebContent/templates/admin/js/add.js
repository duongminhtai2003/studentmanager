function processUserLogin()
{
var sdata = {
    mansioneUtente: $('#mansioneUtente').val(),
    usernameStudente: $('#usernameStudente').val(),
    emailDocente: $('#emailDocente').val(),
    passwordUtente: $('#passwordUtente').val()};

$.ajax(
{	
	 url: "", 
     type: 'POST',
     dataType: 'html',
    url:'<%=request.getContextPath()%>/public/comment/add',
    type:'POST',
    data: sdata,
    dataType: 'JSON',
    async: false,
    success: function(data)
    {
        if(data.status === true)
            alert(data.error);
        else
            alert(data.error);
    },
    error: function (jqXHR, textStatus, errorThrown,data) 
    {
        alert("JQXHR: " + jqXHR + " TEXT STATUS: " + textStatus + " ERROR THROWN: " + errorThrown + " DATA: " + data);
    }
});
}