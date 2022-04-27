<template>

  <div style="width: 1500px;border-style: hidden">
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
          <div><i class="el-icon-bank-card" /> 微服务个数</div>
          <div style="padding: 10px 0; text-align: center; font-weight: bold">
            {{portCount}}
          </div>
        </el-card>
      </el-col>

    </el-row>
    <div style="margin: 10px 0; border-style: hidden">
      <el-input style="width: 200px;padding-right: 5px" placeholder="请输入ip" suffix-icon="el-icon-search" v-model="ip"></el-input>
      <el-input style="width: 200px" placeholder="请输入端口号" suffix-icon="el-icon-search" v-model="port"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
      <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定批量删除这些数据吗？"
              @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange"  width="900px" style="border-style: hidden">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="200"></el-table-column>
      <el-table-column prop="ip" label="ip地址" width="300"></el-table-column>
      <el-table-column prop="visitTime" label="访问时间"  width="300" ></el-table-column>
      <el-table-column prop="requestUri" label="目标地址"  width="300"></el-table-column>
      <el-table-column prop="port" label="目标端口" width="200"></el-table-column>

      <el-table-column label="操作"  width="100" align="center">
        <template slot-scope="scope">
          <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  icon="el-icon-info"
                  icon-color="red"
                  title="您确定删除吗？"
                  @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[2, 5, 10, 20]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import {serverIp} from "../../public/config";

  export default {
    name: "Route",
    data() {
      return {
        userCount:"",
        visitCount:"",
        portCount:"",
        serverIp: serverIp,
        tableData: [],
        total: 0,
        pageNum: 1,
        pageSize: 10,
        ip: "",
        port: "",
        form: {},
        dialogFormVisible: false,
        multipleSelection: [],
      }
    },
    created() {
      this.load()
      this.mounted()
    },
    methods: {
      load() {
        this.request.get("/data/page", {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            ip: this.ip,
            port: this.port,
          }
        }).then(res => {

          this.tableData = res.data.records
          this.total = res.data.total

        });
      },
      mounted(){
        this.request.get("/data/top",).then(res => {
          this.userCount = res.userCount
          this.visitCount = res.visitCount
          this.portCount = res.portCount
        });

      },
      save() {
        this.request.post("/route", this.form).then(res => {
          if (res.code === '200') {
            this.$message.success("保存成功")
            this.dialogFormVisible = false
            this.load()
          } else {
            this.$message.error("保存失败")
          }
        })
      },
      del(id) {
        this.request.delete("/data/" + id).then(res => {
          if (res.code === '200') {
            this.$message.success("删除成功")
            this.load()
            this.mounted()
          } else {
            this.$message.error("删除失败")
          }
        })
      },
      handleSelectionChange(val) {
        console.log(val)
        this.multipleSelection = val
      },
      delBatch() {
        let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
        this.request.post("/data/del/batch", ids).then(res => {
          if (res.code === '200') {
            this.$message.success("批量删除成功")
            this.load()
            this.mounted()
          } else {
            this.$message.error("批量删除失败")
          }
        })
      },
      reset() {
        this.ip = ""
        this.port = ""
        this.load()
      },
      handleSizeChange(pageSize) {
        console.log(pageSize)
        this.pageSize = pageSize
        this.load()
      },
      handleCurrentChange(pageNum) {
        console.log(pageNum)
        this.pageNum = pageNum
        this.load()
      }
    }
  }
</script>


<style>
  .headerBg {
    background: #eee!important;
  }
</style>

