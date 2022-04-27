<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入uri" suffix-icon="el-icon-search" v-model="routeUri"></el-input>
      <el-input style="width: 200px" placeholder="请输入优先级" suffix-icon="el-icon-position" class="ml-5" v-model="routeOrder"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定批量删除这些数据吗？"
              @confirm="delBatch"
      >
      </el-popconfirm>
      <el-button type="primary" class="ml-5" @click="routeRelease">路由发布 <i class="el-icon-bottom"></i></el-button>
      <el-button type="primary" @click="routeRefresh" class="ml-5">路由刷新 <i class="el-icon-top"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="routeId" label="routeID" width="200"></el-table-column>
      <el-table-column prop="routeUri" label="路由地址" width="200"></el-table-column>
      <el-table-column prop="routeOrder" label="优先级" width="200"></el-table-column>
      <el-table-column prop="predicates" label="断言" width="400" ></el-table-column>
      <el-table-column prop="filters" label="过滤器" width="400"></el-table-column>

      <el-table-column label="操作"  width="200" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
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

    <el-dialog title="路由信息" :visible.sync="dialogFormVisible" width="30%" >
      <el-form label-width="80px" size="small">
        <el-form-item label="路由名称">
          <el-input v-model="form.routeId" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="路由地址">
          <el-input v-model="form.routeUri" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="断言">
          <el-input v-model="form.predicates" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="过滤器">
          <el-input v-model="form.filters" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="优先级">
          <el-input v-model="form.routeOrder" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {serverIp} from "../../public/config";

  export default {
    name: "Route",
    data() {
      return {
        serverIp: serverIp,
        tableData: [],
        total: 0,
        pageNum: 1,
        pageSize: 10,
        routeUri: "",
        routeOrder: "",
        form: {},
        dialogFormVisible: false,
        multipleSelection: [],
      }
    },
    created() {
      this.load()
    },
    methods: {
      load() {
        this.request.get("/gateway-routes/list", {
          params: {
            pageNum: this.pageNum,
            pageSize: this.pageSize,
            routeUri: this.routeUri,
            routeOrder: this.routeOrder,
          }
        }).then(res => {

          this.tableData = res.data.records
          this.total = res.data.total

        })
      },
      save() {
        this.request.post("/gateway-routes/save", this.form).then(res => {
          if (res.code === '200') {
            this.$message.success("保存成功")
            this.dialogFormVisible = false
            this.load()
          } else {
            this.$message.error("保存失败")
          }
        })
      },
      handleAdd() {
        this.dialogFormVisible = true
        this.form = {}
      },
      handleEdit(row) {
        this.form = JSON.parse(JSON.stringify(row))
        this.dialogFormVisible = true
      },
      del(id) {
        this.request.delete("/gateway-routes/" + id).then(res => {
          if (res.code === '200') {
            this.$message.success("删除成功")
            this.load()
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
        this.request.post("/route/del/batch", ids).then(res => {
          if (res.code === '200') {
            this.$message.success("批量删除成功")
            this.load()
          } else {
            this.$message.error("批量删除失败")
          }
        })
      },
      reset() {
        this.routeUri = ""
        this.routeOrder = ""
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
      },
      routeRefresh() {
       //jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
      },
      handleExcelImportSuccess() {
        this.$message.success("导入成功")
        this.load()
      },
      routeRelease(){
        this.request.get("/version/add", {
        }).then(res => {
          if (res.code === '200') {
            this.$message.success("路由发布成功")
            this.load()
          } else {
            this.$message.error("路由发布失败")
          }

        })
      }
    }
  }
</script>


<style>
  .headerBg {
    background: #eee!important;
  }
</style>
