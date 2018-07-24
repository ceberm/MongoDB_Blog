<!DOCTYPE html>
<html>
<head>
    <title>My Blog</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</head>
<body>

<#if username??>
    <h2>Welcome ${username}</h2> <a href="/logout" class="btn btn-secondary btn-sm float-right" role="button" aria-pressed="true">Logout</a>

</#if>
<a href="/newpost" class="btn btn-primary text-white btn-lg" role="button" aria-pressed="true">New Post</a>
<p>
<#if myposts?has_content>
  <#list myposts as post>
      <h2><a href="/post/${post["permalink"]}">${post["title"]}</a></h2>
      Posted ${post["date"]?datetime} <i>By ${post["author"]}</i><br>
      Comments:
      <#if post["comments"]??>
          <#assign numComments = post["comments"]?size>
              <#else>
                  <#assign numComments = 0>
      </#if>

      <a href="/post/${post["permalink"]}">${numComments}</a>
      <hr>
      ${post["body"]!""}
      <p>

      <p>
          <em>Filed Under</em>:
          <#if post["tags"]??>
              <#list post["tags"] as tag>
                   ${tag}
              </#list>
          </#if>

      <p>
  </#list>
<#else>
  <h2>There are no posts yet. Please add a post!</h2>
</#if>
</body>
</html>

