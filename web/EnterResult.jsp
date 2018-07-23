
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="tableStyle.css">
    <title>Result</title>
    <style>
        table {
            width: 100%;
            border: 4px solid blue;
            border-collapse: collapse;

        }

        td {
            color: black;
            padding: 0px;
            border: 2px solid blue;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            color: white;
            padding: 10px;
            background-color: black;
            border: 2px solid blue;
        }

        tr:nth-child(even) {
            background-color: lightpink
        }

        tr:nth-child(odd) {
            background-color: lightcoral;
        }

        tr:hover {
            background-color: lightseagreen;
        }

        #searchField {
            float: right;
            width: 250px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 45px;
            font-size: 16px;
            background-color: white;
            background-image: url('images/searchIcon.png');
            background-position: 10px 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
        }

        #resultField {
            display: inline;
            width: 100%;
            height: 100%;
            padding: 15px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            border: none;
        }

        input[type=submit] {
            padding: 5px 15px;
            background: green;
            border: 3px solid black;
            padding: 10px 25px;
            cursor: pointer;
            color: white;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            display: flex;
            justify-content: center;
        }

    </style>
</head>
<body style="background-color: lightblue">
<%@include file="header.jsp"%>
<form method="get">
    <h1 style="text-align:center; font-size:2.0cm;">Result Sheet</h1>
    <input id=searchField type="text" size=30 name="serchfield" placeholder="Search">
    <br><br><br><br><br><br>
    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Father Name</th>
            <th>Urdu/100</th>
            <th>English/100</th>
            <th>Physics/100</th>
            <th>Chemistry/100</th>
            <th>Computer/100</th>
            <th>Islamiyat/100</th>
        </tr>

        <tr>
            <td>1</td>
            <td>H.M.Zahid</td>
            <td>M.Rafiq</td>
            <td><input id=resultField type="text" name="subject1" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject2" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject3" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject4" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject5" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject6" placeholder="marks" pattern="[0-9]*"></td>
        </tr>

        <tr>
            <td>2</td>
            <td>M.Ali</td>
            <td>Muhammad Fiaz</td>
            <td><input id=resultField type="text" name="subject1" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject2" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject3" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject4" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject5" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject6" placeholder="marks" pattern="[0-9]*"></td>
        </tr>

        <tr>
            <td>3</td>
            <td>Mudassar</td>
            <td>M.Ali</td>
            <td><input id=resultField type="text" name="subject1" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject2" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject3" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject4" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject5" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject6" placeholder="marks" pattern="[0-9]*"></td>
        </tr>

        <tr>
            <td>4</td>
            <td>Hamza</td>
            <td>M.Sadiq</td>
            <td><input id=resultField type="text" name="subject1" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject2" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject3" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject4" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject5" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject6" placeholder="marks" pattern="[0-9]*"></td>
        </tr>

        <tr>
            <td>5</td>
            <td>H.M.Aslam</td>
            <td>M.Rafiq</td>
            <td><input id=resultField type="text" name="subject1" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject2" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject3" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject4" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject5" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject6" placeholder="marks" pattern="[0-9]*"></td>
        </tr>

        <tr>
            <td>6</td>
            <td>Muhammad Amir</td>
            <td>M.Ejaz</td>
            <td><input id=resultField type="text" name="subject1" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject2" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject3" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject4" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject5" placeholder="marks" pattern="[0-9]*"></td>
            <td><input id=resultField type="text" name="subject6" placeholder="marks" pattern="[0-9]*"></td>
        </tr>


    </table>
    <br><br><br><br><br>
    <input type="submit" style="size:20" value="Submit">
</form>
</body>
</html>