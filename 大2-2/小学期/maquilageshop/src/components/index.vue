<template>
  <div class="hello">
    <el-calendar id="datt" v-model="value"> </el-calendar>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      value: new Date(),
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#datt{
  font-size:30px;
  font-weight: 700;
}
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}

</style>
