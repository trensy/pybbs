<#include "layout/layout.ftl"/>
<@html page_title="登录" page_tab="login">
  <div class="box" style="width: 500px;">
    <div class="box-heading">登录</div>
    <div class="box-body">
      <table style="width: 100%;border-spacing: 5px;">
        <tr>
          <td width="60">用户名</td>
          <td><input type="text" name="username" id="username" placeholder="用户名"/></td>
        </tr>
        <tr>
          <td>密码</td>
          <td><input type="password" name="password" id="password" placeholder="密码"/></td>
        </tr>
      </table>
    </div>
    <div class="box-footer">
      <a href="/register">注册</a>
      <button class="pull-right" onclick="login()">登录</button>
    </div>
  </div>
  <script>
    function login() {
      var username = $("#username").val();
      var password = $("#password").val();
      if (!username) {
        alert("请输入用户名");
        return;
      }
      if (!password) {
        alert("请输入密码");
        return;
      }
      $(".loading").show();
      $.post("/api/login", {
        username: username,
        password: password
      }, function (data) {
        if (data.code === 200) {
          window.location.href = "/";
        } else {
          alert(data.description);
        }
        $(".loading").hide();
      })
    }
  </script>
</@html>
