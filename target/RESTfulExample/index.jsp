<html>
    <head>
        <title>Chat With Me</title>

    </head>
    <body>

        User Msg :<input type="text" name="usermsg" id="usermsg" onkeydown="Javascript: if (event.keyCode == 13)
                    setMsg(document.getElementById('usermsg').value);" > 

        <input  type="button" value="send" id="sendbtn" onclick="setMsg(document.getElementById('usermsg').value);"><br>



        <!--        <p id="chatcontent"></p>-->
        <script type="text/javascript">
            var humanmsgcount = 0;
            var botresponse = 0;
            var humanelementid = "humanmsg:" + humanmsgcount;

            function setMsg(msg) {
                humanmsgcount++;
                console.log(msg);
                var domelement = document.createElement("P");
                domelement.setAttribute("id", humanelementid);
                domelement.setAttribute("style", "color:blue");
                domelement.appendChild(document.createTextNode("Human:" + msg));
                document.body.appendChild(domelement);
//                document.getElementById('chatcontent').innerHTML += "Human:" + msg
//                        + "<br>";
                sendMsgtoServer();

                document.getElementById("usermsg").value = "";
                document.getElementById("usermsg").focus();

            }

            function sendMsgtoServer() {
                botresponse++;
                var request;
                console.log("A")
                try {
                    request = new XMLHttpRequest();
                } catch (e) {
                    alert("Browser error");
                }
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        console.log("B");
                        var response = request.responseText;
                        var domelement = document.createElement("P");

                        domelement.appendChild(document.createTextNode(response));
                        document.body.appendChild(domelement);


                    }

                }
                var humanmsg = document.getElementById("usermsg").value;
                request.open("GET", "rest/chat/" + humanmsg, true);
                request.send();

            }

        </script>
    </body>
</html>