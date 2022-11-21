<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST" action="/qna_insert.do" onsubmit="">
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
       
          <tr>
            <th>사용하는 아이디</th>
            <td>
              <input class="w-96 input input-bordered" name="qna_user_id" type="text" placeholder="사용하는 아이디" />
            </td>
          </tr>
          <tr>
            <th>질문 내용</th>
            <td>
              <textarea class="w-full textarea textarea-bordered" name="qna_content" rows="10" placeholder="질문 내용"></textarea>
            </td>
          </tr>
         
           <tr>
            <th>사용자 이네일 주소</th>
            <td>
              <input class="w-96 input input-bordered" name="qna_user_email" type="text" placeholder="사용자 이네일 주소" />
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
</head>
<body>
	
</body>
</html>