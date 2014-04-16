<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Demo</title>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js"></script>

    <style>
        .reply-form {
            display: none;
        }
    </style>

</head>
<body>
<a href="http://jquery.com/">jQuery</a>
<script src="jquery.js"></script>



<div class='reply'>Reply</div>
<form action='add_reply.php' method='POST' class='reply-form'>
    <textarea name='replybody'></textarea>
    <input type='hidden' name='comment_id' value='<?php echo $comment_id; ?>' />
    <input type='submit' value='Reply' />
</form>

<script>
    $(".reply").click(function() {
        $(this).siblings(".reply-form").show();
        $(this).hide();
    });
</script>
</body>
</html>
