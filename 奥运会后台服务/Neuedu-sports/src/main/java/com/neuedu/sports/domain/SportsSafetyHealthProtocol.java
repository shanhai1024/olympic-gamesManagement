package com.neuedu.sports.domain;

import java.time.LocalDate;
import com.fasterxml.jackson.annotation.JsonFormat;
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
 * 安全与健康协议对象 sports_safety_health_protocol
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "安全与健康协议对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_safety_health_protocol")
public class SportsSafetyHealthProtocol extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 协议内容 */
    @Schema(title = "协议内容")
    @Excel(name = "协议内容")
    private String protocolContent;

    /** 生效日期 */
    @Schema(title = "生效日期")
    @Excel(name = "生效日期")
    private LocalDate effectiveDate;
}
