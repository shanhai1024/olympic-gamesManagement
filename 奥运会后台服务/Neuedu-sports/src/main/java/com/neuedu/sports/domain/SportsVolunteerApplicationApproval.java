package com.neuedu.sports.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.neuedu.common.annotation.Excel;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.neuedu.common.core.domain.BaseEntity;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * 志愿者管理-申请与审批对象 sports_volunteer_application_approval
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "志愿者管理-申请与审批对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_volunteer_application_approval")
public class SportsVolunteerApplicationApproval extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 志愿者姓名 */
    @Schema(title = "志愿者姓名")
    @Excel(name = "志愿者姓名")
    private String volunteerName;

    /** 申请状态 */
    @Schema(title = "申请状态")
    @Excel(name = "申请状态")
    private String applicationStatus;

    /** 资格审查 */
    @Schema(title = "资格审查")
    @Excel(name = "资格审查")
    private String qualificationReview;

    /** 分配信息 */
    @Schema(title = "分配信息")
    @Excel(name = "分配信息")
    private String assignmentInfo;
}
