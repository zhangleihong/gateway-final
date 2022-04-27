<template>
  <div>
    <el-row :gutter="10" style="margin-bottom: 60px">
      <el-col :span="8">
        <el-card style="color: #409EFF">
          <div><i class="el-icon-user-solid" /> 用户总数</div>
          <div style="padding: 10px 0; text-align: center; font-weight: bold">
            {{userCount}}
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card style="color: #F56C6C">
          <div><i class="el-icon-money" /> 总访问量</div>
          <div style="padding: 10px 0; text-align: center; font-weight: bold">
            {{visitCount}}
          </div>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card style="color: #67C23A">
          <div><i class="el-icon-bank-card" /> 微服务访问数</div>
          <div style="padding: 10px 0; text-align: center; font-weight: bold">
            {{portCount}}
          </div>
        </el-card>
      </el-col>

    </el-row>

    <el-row class="block">
      <!--      <p>组件值：{{ value }}</p>-->
      <div style="color: #409EFF; margin-bottom: 20px"><i class="el-icon-user-solid" /> 指定时间内端口的访问统计</div>
      <el-date-picker
              v-model="startTimeValue"
              align="right"
              type="date"
              unlink-panels
              value-format="yyyy-MM-dd"
              placeholder="开始日期"
              :picker-options="pickerOptions">
      </el-date-picker>
      <span style="margin-left: 20px;margin-right: 20px">至</span>
      <el-date-picker
              v-model="endTimeValue"
              align="right"
              type="date"
              unlink-panels
              value-format="yyyy-MM-dd"
              placeholder="结束日期"
              :picker-options="pickerOptions">
      </el-date-picker>
      <el-button type="primary" style="margin-left: 10px" @click="portDataLoad(),uriDataLoad(),ipDataLoad()">查询</el-button>
    </el-row>

    <el-row style="margin-top: 50px">
      <el-col :span="8">
        <div id="main" style="width: 500px; height: 450px"></div>
      </el-col>

      <el-col :span="8">
        <div id="bar" style="width: 500px; height: 450px"></div>
      </el-col>

      <el-col :span="8">
        <div id="pie" style="width: 500px; height: 450px"></div>
      </el-col>

    </el-row>


  </div>
</template>

<script>
  import * as echarts from 'echarts'
  import {serverIp} from "../../public/config";

  export default {
    name: "Home",
    data() {
      return {
        userCount:"",
        visitCount:"",
        portCount:"",
        serverIp: serverIp,
        value: '',
        startTimeValue: "",
        endTimeValue: "",
      }
    },

    created() {
    },

    mounted() {  // 页面元素渲染之后再触发
      this.load()
      this.portDataLoad()
      this.uriDataLoad()
      this.ipDataLoad()

    },
    methods: {
      load() {
        this.request.get("/data/top",).then(res => {
          this.userCount = res.userCount
          this.visitCount = res.visitCount
          this.portCount = res.portCount
        });
      },
      portDataLoad() {
        var option = {
          title: {
            text: '所有用户访问端口统计',
            subtext: '折线图',
            left: 'center'
          },
          xAxis: {
            type: 'category',
            data: []
          },
          yAxis: {
            type: 'value'

          },
          series: [
            {
              data: [],
              type: 'line',
              itemStyle : { normal: {label : {show: true}}}
            }
          ]
        };

        var chartDom = document.getElementById('main');
        var myChart = echarts.init(chartDom);

        this.request.get("/echarts/portCount", {
          params: {
            startTime: this.startTimeValue,
            endTime: this.endTimeValue,
          }
        }).then(res => {
          option.xAxis.data = res.data[0]
          option.series[0].data = res.data[1]
          myChart.setOption(option);

        });
      },
      uriDataLoad(){
        var baroption = {
          title: {
            text: '所有用户uri访问统计',
            subtext: '柱状图',
            left: 'center'
          },
          xAxis: {
            type: 'category',
            data: []
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              data: [],
              type: 'bar',
              showBackground: true,
              backgroundStyle: {
                color: 'rgba(180, 180, 180, 0.2)'
              },
              itemStyle: {
                normal: {
                  label: {
                    show: true,  //开启显示
                    position: 'top',  //在上方显示
                    textStyle: {  //数值样式
                      color: 'blue',
                      fontSize: 16
                    }
                  }
                }
              },
            }
          ]
        };

        var barDom = document.getElementById('bar');
        var barChart = echarts.init(barDom);
        this.request.get("/echarts/uriCount", {
          params: {
            startTime: this.startTimeValue,
            endTime: this.endTimeValue,
          }
        }).then(res => {
          baroption.xAxis.data = res.data[0]
          baroption.series[0].data = res.data[1]
          barChart.setOption(baroption);
        });
      },
      ipDataLoad(){
        var pieoption = {
          title: {
            text: '所有用户ip统计',
            subtext: '饼状图',
            left: 'center'
          },
          tooltip: {
            trigger: 'item'
          },
          legend: {
            orient: 'vertical',
            left: 'left',
          },
          series: [
            {
              name: 'IP 统计',
              type: 'pie',
              radius: '70%',
              center: ['55%', '50%'],
              data: [
              ],
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
        };
        var pieDom = document.getElementById('pie');
        var pieChart = echarts.init(pieDom);
        this.request.get("/echarts/ipCount", {
          params: {
            startTime: this.startTimeValue,
            endTime: this.endTimeValue,
          }
        }).then(res => {
          const pieData = [];
          for(let i=0; i<res.data[0].length; i++) {
            const obj = {};

            obj.value = res.data[1][i];
            obj.name = res.data[0][i];
            pieData[i] = obj;
          }
          pieoption.series[0].data = pieData
          pieChart.setOption(pieoption);
        });

      }

    }

  }
</script>

<style scoped>

</style>
