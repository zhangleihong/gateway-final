<template>
    <div>
        <div style="margin: 10px 0">
            <el-input style="width: 200px" placeholder="ip" suffix-icon="el-icon-search" v-model="ip"></el-input>
            <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
            <el-button type="warning" @click="reset">重置</el-button>
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
                <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
            </el-popconfirm>
        </div>

        <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="id" label="ID" width="80"></el-table-column>
            <el-table-column prop="ip" label="ip" width="200"></el-table-column>
            <el-table-column prop="flag" label="flag" width="200"></el-table-column>
            <el-table-column width="70" align="center" label="开关">
                <template slot-scope="scope">
                    <el-switch
                            v-model="scope.row.flag"
                            :active-value=1
                            :inactive-value=0
                            class="ml-2"
                            active-color="#13ce66"
                            inactive-color="#ff4949"
                            @change="changeOnSwitch(scope.row.id)"

                    />
                </template>
            </el-table-column>

            <el-table-column label="操作"  width="180" align="center">
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
                        <el-button type="danger" slot="reference" align="center">删除 <i class="el-icon-remove-outline"></i></el-button>
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
                <el-form-item label="ip地址">
                    <el-input v-model="form.ip" autocomplete="off"></el-input>
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
        name: "White",
        data() {
            return {
                serverIp: serverIp,
                tableData: [],
                total: 0,
                pageNum: 1,
                pageSize: 10,
                ip: "",
                valueSwitch:false,
                form: {},
                swicthValue: 0,
                dialogFormVisible: false,
                multipleSelection: [],
            }
        },
        created() {
            this.load()
        },
        mounted(){
            this.switchLoad(6)
        },
        methods: {
            load() {
                this.request.get("/whiteList/page", {
                    params: {
                        pageNum: this.pageNum,
                        pageSize: this.pageSize,
                        ip: this.ip,
                    }
                }).then(res => {

                    this.tableData = res.data.records
                    console.log( res.data.records.flag)


                    this.total = res.data.total

                })
            },
            flagSet(){

            },
            save() {
                this.request.post("/whiteList", this.form).then(res => {
                    if (res.code === '200') {
                        this.$message.success("保存成功")
                        this.dialogFormVisible = false
                        this.load()
                    } else if (res.code === '500'){
                        this.$message.error("ip已存在")
                    }else{
                        const msg = res.msg();
                        this.$message.success(msg)
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
                this.request.delete("/whiteList/" + id).then(res => {
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
                this.request.post("/whiteList/del/batch", ids).then(res => {
                    if (res.code === '200') {
                        this.$message.success("批量删除成功")
                        this.load()
                    } else {
                        this.$message.error("批量删除失败")
                    }
                })
            },
            reset() {
                this.ip = ""
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
            changeOnSwitch(id){
                this.request.post("/whiteList/changeFlag",id).then(res => {
                    if (res.code === '200') {
                        this.$message.success("修改成功")
                        this.load()

                    } else {
                        this.$message.error("修改失败")
                    }
                })
            },
            switchLoad(row){

            }
        }
    }
</script>


<style>
    .headerBg {
        background: #eee!important;
    }
</style>
