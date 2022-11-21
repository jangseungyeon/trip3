<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<body>
<h1>
HELLO WORLD!
</h1>
<p><a href="WEB-INF/board/list">WRITE</a></p>

<section class="">
  <div class="">
    <form class="" method="POST" action="qna_insert.do" onsubmit="ArticleWrite__submitForm(this); return false;">
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
         <tr>
            <th>사용하는아이디</th>
            <td>
              <input class=" input-bordered" name="qna_use_id" placeholder="사용하는아이디" />
            </td>
          </tr>
         
          <tr>
            <th>질문내용</th>
            <td>
              <textarea class=" textarea textarea-bordered" name="qna_content" rows="10" placeholder="내용"></textarea>
            </td>
          </tr>
             <tr>
            <th>사용자이메일주소</th>
            <td>
              <input class=" input-bordered" name="qna_user_email" type="text" placeholder="사용자이메일주소" />
            </td>
          </tr>
          <tr>
            <th>작성</th>
            <td>
              <button type="submit" class="btn btn-primary">작성</button>
              <button type="button" class="btn btn-secondary btn-outline" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>

    <div class="btns"></div>
  </div>
</section>
</body>
</html>