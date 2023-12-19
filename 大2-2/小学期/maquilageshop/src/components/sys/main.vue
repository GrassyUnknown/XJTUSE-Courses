<template>
  <el-container>
    <el-header style="height: 80px;">
      <el-row :gutter="20">
        <el-col :span="4">
          <div class="bgs" style="height: 80px; display: flex;line-height: 80px;" >
            <img
              src="../../assets/logo.png"
              alt=""
              style="width: 80px; height: 80px"
            />
            <span>管理平台</span>
          </div>
        </el-col>
        <el-col :span="14" > 

          <el-tabs v-model="activeName" @tab-click="handleClick(activeName)"  >
            <el-tab-pane  name="first" >
              <span slot="label"><i class="el-icon-date"></i> 我的行程</span>
            </el-tab-pane>
            <el-tab-pane  name="second" >
              <span slot="label"><i class="el-icon-date"></i> 我的行程</span>
            </el-tab-pane>
            <el-tab-pane  name="third" >
              <span slot="label"><i class="el-icon-date"></i> 我的行程</span>
            </el-tab-pane>
            <el-tab-pane  name="fourth" >
              <span slot="label"><i class="el-icon-date"></i> 我的行程</span>
            </el-tab-pane>
            
          </el-tabs>
          <!-- <img src="../../assets/icon1.svg" alt="" style="width: 40px;height: 40px;">
          <p>小李</p> -->
      </el-col>
        <el-col :span="6">
          <el-dropdown>
            <i class="el-icon-setting" style="margin-right: 15px"></i>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>查看</el-dropdown-item>
              <el-dropdown-item>新增</el-dropdown-item>
              <el-dropdown-item>删除</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <span>当前用户:{{  }}</span>
        </el-col>
      </el-row>
    </el-header>
    <el-container>
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu @select="handleOpen">
          <el-submenu index="1">
            <template slot="title"
              ><i class="el-icon-message"></i>用户管理</template
            >
            <el-menu-item-group>
              <el-menu-item index="/main/user">展示用户</el-menu-item>
              <el-menu-item index="">权限管理</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title"
              ><i class="el-icon-menu"></i>我的小店</template
            >
            <el-menu-item-group>
              <template slot="title">商店信息</template>
              <el-menu-item index="">我的商品</el-menu-item>
              <el-menu-item index="">商品类型</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group>
              <template slot="title">订单管理</template>
              <el-menu-item index="">我的订单</el-menu-item>
            </el-menu-item-group>
            <el-menu-item-group title="客户">
              <el-menu-item index="">客户聊天</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="3">
            <template slot="title"
              ><i class="el-icon-setting"></i>收入统计</template
            >
            <el-menu-item-group>
              <template slot="title">收入统计</template>
              <el-menu-item index="">本店收入</el-menu-item>
              <el-menu-item index="">评价情况</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-aside>
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
export default {

  methods: {
    handleOpen(key, keyPath) {
      this.$router.push(key);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClick(val) {
      // this.$router.push("/main/index");
        console.log(val);
        if(val==="first"){
          console.log("a");
        }
        if(val==="second"){
          console.log("b");
        }
        if(val==="third"){
          console.log("c");
        }
        if(val==="fourth"){
          console.log("d");
        }
      }
  },
  mounted() {
    
  },
  data() {
    return {
      loginUser: "",
      activeName:"first",
      src:"https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg"
    };
  },
};
</script>

<style scoped>
.bgs {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}
.el-header {
  height: 100px;
  background-color: #b3c0d1;
  color: #333;
  line-height: 80px;
}

.el-aside {
  color: #333;
}
.abc {
  height: 100%;
}


</style>