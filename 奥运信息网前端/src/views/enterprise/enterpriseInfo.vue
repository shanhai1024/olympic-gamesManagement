<template>
  <div class="information">
    <div class="content">
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">企业名称：</span>
          <span class="text">{{ enterpriseData.name }}</span>
        </el-col>
        <el-col :md="16" :xs="24">
          <span class="label">统一社会信用代码：</span>
          <span class="text">{{ enterpriseData.usci }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">公司注册地址：</span>
          <span class="text">{{ enterpriseData.address }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">机构类型：</span>
          <span class="text">{{ getDictValue(enterpriseData.affiliation, 'enterpriseAffiliation') }}</span>
        </el-col>
        <el-col :md="8" :xs="24">
          <span class="label">企业性质：</span>
          <span class="text">{{ getDictValue(enterpriseData.enterpriseNature, 'enterpriseNature') }}</span>
        </el-col>
        <el-col :md="8" :xs="24">
          <span class="label">成立日期：</span>
          <span class="text">{{ parseTime(enterpriseData.doe, '{y}年{m}月{d}日') }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">法人/负责人：</span>
          <span class="text">{{ enterpriseData.corpn }}</span>
        </el-col>
        <el-col :md="16" :xs="24">
          <span class="label">法人/负责人身份证：</span>
          <span class="text">{{ enterpriseData.corpnIdcard }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">法人/负责人身份证扫描件：</span>
          <span class="text"><el-button type="text" style="color: #17C2AA;padding-top: 0"
                                        @click="showImage(enterpriseData.corpnIdcardImage,'法人/负责人身份证扫描件')"
          >查看图片</el-button></span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">单位联系地址：</span>
          <span class="text">{{ enterpriseData.contactAddress }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">经营范围：</span>
          <span class="text">{{ enterpriseData.businessScope }}</span>
        </el-col>
        <el-col :md="16" :xs="24">
          <span class="label">公司简介：</span>
          <span class="text">{{ enterpriseData.profile }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">营业执照有效期：</span>
          <span class="text">{{ enterpriseData.businessLicenseGp }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">营业执照扫描件：</span>
          <span class="text"><el-button type="text" style="color: #17C2AA;padding-top: 0"
                                        @click="showImage(enterpriseData.businessLicenseImage,'营业执照扫描件')"
          >查看图片</el-button></span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">开户行：</span>
          <span class="text">{{ enterpriseData.bank }}</span>
        </el-col>
        <el-col :md="16" :xs="24">
          <span class="label">银行账号：</span>
          <span class="text">{{ enterpriseData.account }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">开户行地址：</span>
          <span class="text">{{ enterpriseData.addr }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">行业：</span>
          <span class="text" v-text="industryFormat(enterpriseData.industry )"></span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">单位注册电话：</span>
          <span class="text">{{ enterpriseData.registrationPhone }}</span>
        </el-col>
        <el-col :md="16" :xs="24">
          <span class="label">单位注册地址：</span>
          <span class="text">{{ enterpriseData.contactAddr }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="8" :xs="24">
          <span class="label">注册资本（万元）：</span>
          <span class="text">{{ enterpriseData.registeredCapital }}</span>
        </el-col>
        <el-col :md="16" :xs="24">
          <span class="label">实缴资本：</span>
          <span class="text">{{ enterpriseData.paidinCapital }}</span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <span class="label">开户许可证/基本户存款信息证：</span>
          <span class="text"><el-button type="text" style="color: #17C2AA;padding-top: 0"
                                        @click="showImage(enterpriseData.accountLicence,'开户许可证/基本户存款信息证')"
          >查看图片</el-button></span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :md="24" :xs="24">
          <div style="width: 90%; display: flex;flex-direction: row-reverse;">
            <el-button style="background: #17C2AA;width: 72px;height: 32px;border-radius: 4px;color: #FFFFFF;"
                       @click="handleUpdate"
            >{{enterpriseStatus?'修改':'新增'}}
            </el-button>
          </div>
        </el-col>
      </el-row>

      <div
        v-if="enterpriseData.pass"
        style="
          position: absolute;
          top: 50px;
          right: 50px;
          text-align: center;
          transform: rotateZ(30deg);
          opacity: 0.5;
          font-size: 50px;
          color: green;
          border: 0.1em solid green;
        ">
        审核通过
      </div>
    </div>

    <el-dialog v-model="imageVisible" :title="`${imageVisibleTitle}`" width="80%" append-to-body
               :closed="closeImage"
    >
      <el-image :src="imageUrl"
                style="display: block; max-width: 400px; max-height: 400px; margin: 0 auto;"
      >
        <div slot="placeholder" class="image-slot">
          加载中<span class="dot">...</span>
        </div>
      </el-image>
      <div
        style="position: absolute; top: 50%; left: 0; width: 100%; text-align: center; transform: rotateZ(45deg); opacity: 0.5;font-size: 50px; color: #eee;"
      >双碳采购网
      </div>
    </el-dialog>

    <el-dialog title="编辑企业信息" v-model="open" :width="isSmallScreen ? '90%' : '1000px'" append-to-body>
      <el-form ref="form" :model="enterpriseData" :rules="rules" label-width="150px"
               :label-position="isSmallScreen ? 'top' : 'right'"
      >
        <el-row>
          <el-col :md="12" v-if="enterpriseData.id == undefined" :xs="24">
            <el-form-item label="企业名称" prop="name" style="width: 100%">
              <el-input v-model="enterpriseData.name" placeholder="请输入企业名称"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="公司注册地址" prop="address" style="width: 100%">
              <el-input v-model="enterpriseData.address" placeholder="请输入公司注册地址"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="所属机构" prop="affiliation" style="width: 100%">
              <!--          <el-input v-model="form.affiliation" placeholder="请输入所属机构"/>-->
              <el-select v-model="enterpriseData.affiliation" placeholder="请输入所属机构">
                <el-option
                  v-for="dict in enterpriseAffiliation"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="企业性质" prop="enterpriseNature">
              <!--          <el-input v-model="form.enterpriseNature" placeholder="请输入企业性质"/>-->
              <el-select v-model="enterpriseData.enterpriseNature" placeholder="请输入企业性质">
                <el-option
                  v-for="dict in enterpriseNature"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="成立日期" prop="doe">
              <el-date-picker clearable size="small"
                              v-model="enterpriseData.doe"
                              type="date"
                              value-format="yyyy-MM-dd"
                              placeholder="选择成立日期"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="法人/负责人" prop="corpn" style="width: 100%">
              <el-input v-model="enterpriseData.corpn" placeholder="请输入法人/负责人"/>
            </el-form-item>

          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="法人/负责人身份证" prop="corpnIdcard" style="width: 100%">
              <el-input v-model="enterpriseData.corpnIdcard" placeholder="请输入法人/负责人身份证"/>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="单位联系地址" prop="contactAddress" style="width: 100%">
              <el-input v-model="enterpriseData.contactAddress" placeholder="请输入联系地址"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="经营范围" prop="businessScope" style="width: 100%">
              <el-input v-model="enterpriseData.businessScope" placeholder="请输入经营范围"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="营业执照扫描件" prop="businessLicenseImage" v-if="enterpriseData.id !== undefined">
              <fileUpload :file-type="fileType" :is-show-tip="false"
                          v-model="enterpriseData.businessLicenseImage"
              />
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="公司简介" prop="profile" style="width: 100%">
              <el-input v-model="enterpriseData.profile" placeholder="请输入经营范围"/>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="营业执照有效期" prop="businessLicenseGp" style="width: 100%">
              <el-input v-model="enterpriseData.businessLicenseGp" placeholder="请输入营业执照有效期"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="统一社会信用代码" prop="usci" style="width: 100%">
              <el-input v-model="enterpriseData.usci" placeholder="请输入统一社会信用代码"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="法人/负责人身份证扫描件" prop="corpnIdcardImage">
              <template #label>
                <div style="width: 230px"><span style="color: red">*</span>法人/负责人身份证扫描件</div>
              </template>
              <fileUpload :file-type="fileType" :is-show-tip="false"
                          v-model="enterpriseData.corpnIdcardImage"
                          style="margin-left: 100px"
              />
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">

          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="开户银行" prop="bank" style="width: 100%">
              <el-input v-model="enterpriseData.bank" placeholder="请输入开户银行"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="行业" prop="industry" style="width: 100%">

              <el-select v-model="enterpriseData.industry" placeholder="请选择行业" clearable filterable size="small">
                <el-option
                  v-for="dict in industryOptions"
                  :key="dict.dictValue"
                  :label="dict.dictLabel"
                  :value="dict.dictValue"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="银行账号" prop="account" style="width: 100%">
              <el-input v-model="enterpriseData.account" placeholder="请输入银行账号"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="开户行地址" prop="addr">
              <el-input v-model="enterpriseData.addr" placeholder="请输入开户行地址"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="注册电话" prop="registrationPhone" style="width: 100%">
              <el-input v-model="enterpriseData.registrationPhone" placeholder="请输入注册电话"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="注册地址" prop="contactAddr" style="width: 100%">
              <el-input v-model="enterpriseData.contactAddr" placeholder="请输入注册地址"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
            <el-form-item label="注册资本（万元）" prop="registeredCapital" style="width: 100%">
              <el-input v-model="enterpriseData.registeredCapital" placeholder="请输入注册资本"/>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :md="12" :xs="24">
            <el-form-item label="实缴资本（万元）" prop="paidinCapital" style="width: 100%">
              <el-input v-model="enterpriseData.paidinCapital" placeholder="请输入实缴资本"/>
            </el-form-item>
          </el-col>
          <el-col :md="12" :xs="24">
          </el-col>
        </el-row>
        <el-row>
          <el-col :md="24" :xs="24">
            <el-form-item label="开户许可证/基本户存款信息证" prop="accountLicence" style="width: 100%">
              <template #label>
                <div style="width: 200px"><span style="color: red">*</span>开户许可证/基本户存款信息证</div>
              </template>
              <fileUpload :file-type="fileType" :is-show-tip="false"
                          v-model="enterpriseData.accountLicence"
                          style="margin-left: 100px"
              />
              <!--              <el-input v-model="enterpriseData.accountLicence" placeholder="请输入开户许可证/基本户存款信息证"/>-->
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <template #footer>
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script>
import { addEnterprise, getEnterprise, updateEnterprise } from '@/api/bid/enterprise'
import { parseTime } from '@/utils/neu'
import { getBaseUrl } from '@/utils/env'
import ImageUpload from '@/components/ImageUpload'
import FileUpload from '@/components/FileUpload'
import { rules } from './enterpriseInfoData'
import { mapGetters } from 'vuex'

export default {
  name: 'enterpriseInfo',
  components: {
    ImageUpload,
    FileUpload
  },
  data() {
    return {
      rules,
      // 行业字典
      industryOptions: [],
      fileType: ['bmp', 'png', 'jpg', 'jpeg'],
      enterpriseData: {
        'searchValue': undefined,
        'createBy': '',
        'createTime': undefined,
        'updateBy': '',
        'updateTime': undefined,
        'remark': '',
        'params': {},
        'userName': '',
        'affiliation': '',
        'password': '',
        'salt': '',
        'mobile': '',
        'name': '',
        'shortName': '',
        'addr': undefined,
        'bank': undefined,
        'account': '',
        'taxNo': '',
        'contact': '',
        'contactTel': '',
        'usci': '',
        'address': '',
        'enterpriseNature': '',
        'doe': undefined,
        'corpn': '',
        'corpnIdcard': '',
        'contactAddress': '',
        'businessScope': '',
        'profile': undefined,
        'businessLicenseImage': '',
        'businessLicenseGp': '',
        'corpnIdcardImage': undefined,
        'registrationPhone': '',
        'contactAddr': '',
        'registeredCapital': '',
        'paidinCapital': '',
        'accountLicence': '',
        'ipAddress': '',
        'pass': undefined,
        'industry': '',
      },
      imageUrl: '',
      imageVisible: false,
      imageVisibleTitle: '',
      open: false,

      enterpriseAffiliation: [],
      enterpriseNature: [],

      resizeOb: undefined,
      isSmallScreen: false,
      enterpriseStatus:true
    }
  },
  created() {
    this.getDicts('enterprise_affiliation').then(response => {
      this.enterpriseAffiliation = response.data
    })
    this.getDicts('enterprise_nature').then(response => {
      this.enterpriseNature = response.data
    })
    this.getDicts("industry_list").then(response => {
      this.industryOptions = response.data;
    });
  },

  mounted() {
    this.getEnterpriseData()

    this.resizeOb = new ResizeObserver(() => {
      this.isSmallScreen = document.documentElement.offsetWidth < 540
    })
    this.resizeOb.observe(document.documentElement)
  },
  beforeDestroy() {
    if (this.resizeOb) {
      this.resizeOb.disconnect()
    }
  },

  methods: {
    parseTime,
    getBaseUrl,
    showImage(url, title) {
      this.imageUrl = url
      this.imageVisible = true
      this.imageVisibleTitle = title
    },
    // 行业字典翻译
    industryFormat(data, column) {
      return this.selectDictLabel(this.industryOptions, data);
    },
    closeImage() {
      this.imageVisible = !this.imageVisible
    },

    getEnterpriseData() {
      getEnterprise(this.userId).then(res => {
        if (!res.data) {
          this.$message.warning('用户未设置企业信息，请及时填写')
          this.enterpriseStatus = false;
          return
        }
        this.enterpriseStatus = true
        this.enterpriseData = res.data
      })
    },
    async handleUpdate() {
      await this.getEnterpriseData()
      this.open = true
    },

    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.enterpriseData.id !== undefined) {
            updateEnterprise(this.enterpriseData).then(response => {
              this.msgSuccess('修改成功')
              this.open = false
            })
          } else {
            this.enterpriseData.userName = this.name
            addEnterprise(this.enterpriseData).then(response => {
              this.msgSuccess('保存成功')
              this.open = false
            })
          }
        }
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
    },
    getDictValue(key, type) {
      const value = this[type].filter(x => x.dictValue === key)
      if (value !== undefined && value.length > 0) {
        return value[0].dictLabel
      }
      return ''
    }
  },
  computed: {
    ...mapGetters(['userId', 'name'])
  }
}
</script>

<style lang="scss" scoped>
.content {
  background: #FFFFFF;
  border-radius: 10px;
  width: 90%;
  padding: 20px;
  margin-left: 20px;
}

@media screen and (max-width: 540px) {
  .content {
    margin-left: 15px;
    padding: 10px;
  }
}

.el-row {
  margin-bottom: 20px;
}

.el-col {
  display: flex;
}
</style>


