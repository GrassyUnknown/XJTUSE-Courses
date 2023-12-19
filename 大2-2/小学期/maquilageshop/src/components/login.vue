<template>
  <div class="loginbody">
    <div class="logindata">
      <div class="logintext">
        <h2>后台管理</h2>
      </div>
      <div class="formdata">
        <el-form ref="form" :model="user" >
          <el-form-item prop="userName">
            <el-input
              v-model="user.userName"
              clearable
              placeholder="请输入账号"
            ></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              v-model="user.passWord"
              clearable
              placeholder="请输入密码"
              show-password
            ></el-input>
          </el-form-item>
        </el-form>
      </div>
      <div class="tool">
        <div>
          <el-checkbox v-model="checked" @change="remember"
            >记住密码</el-checkbox
          >
        </div>
        <div>
          <span class="shou" @click="forgetpas">忘记密码？</span>
        </div>
      </div>
      <div class="butt">
        <el-button type="primary" round v-on:click="login">登录</el-button>
        <el-button class="shou" @click="openDialog">注册</el-button>
      </div>
    </div>
    
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "login",
  data() {
    return {
      user: {},
    };
  },
  methods: {
    checked(){

    },
    onSubmit: function () {
      
    },
    openDialog: function () {
      this.dialogFormVisible = true;
      this.user = {};
    },
    login: function () {
      this.$router.push("/main")
    },
    remenber(data) {
      this.checked = data;
      if (this.checked) {
        localStorage.setItem("news", JSON.stringify(this.form));
      } else {
        localStorage.removeItem("news");
      }
    },
    forgetpas() {
      this.$message({
        type: "info",
        message: "功能尚未开发额😥",
        showClose: true,
      });
    },
    register() {},
  },
};
</script>

<style scoped>
.loginbody {
  width: 100%;
  height: 100%;
  min-width: 1000px;
  background-image: url("../assets/login.png");
  background-size: 100% 100%;
  background-position: center center;
  overflow: auto;
  background-repeat: no-repeat;
  position: fixed;
  line-height: 100%;
  padding-top: 150px;
}
.logintext {
  margin-bottom: 20px;
  line-height: 50px;
  text-align: center;
  font-size: 30px;
  font-weight: bolder;
  color: white;
  text-shadow: 2px 2px 4px #000000;
}

.logindata {
  width: 400px;
  height: 300px;
  transform: translate(-50%);
  margin-left: 50%;
}
.tool {
  display: flex;
  justify-content: space-between;
  color: #606266;
}

.butt {
  margin-top: 10px;
  text-align: center;
}

.shou {
  cursor: pointer;
  color: #606266;
}
</style>
