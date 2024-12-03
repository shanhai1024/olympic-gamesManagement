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
 * 安全与健康协议-危机响应对象 sports_crisis_response
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "安全与健康协议-危机响应对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_crisis_response")
public class SportsCrisisResponse extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 危机响应小组信息 */
    @Schema(title = "危机响应小组信息")
    @Excel(name = "危机响应小组信息")
    private String responseTeamInfo;

    /** 通讯机制 */
    @Schema(title = "通讯机制")
    @Excel(name = "通讯机制")
    private String communicationMechanism;
}
