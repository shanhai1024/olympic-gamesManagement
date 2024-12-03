package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.neuedu.common.annotation.Log;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.enums.BusinessType;
import com.neuedu.sports.domain.SportsCrisisResponse;
import com.neuedu.sports.service.ISportsCrisisResponseService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 安全与健康协议-危机响应Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/safeAndHealthy/crisisResponse")
@Tag(name = "【安全与健康协议-危机响应】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsCrisisResponseController extends BaseController
{
    private final ISportsCrisisResponseService sportsCrisisResponseService;

    /**
     * 查询安全与健康协议-危机响应列表
     */
    @Operation(summary = "查询安全与健康协议-危机响应列表")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:crisisResponse:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsCrisisResponse sportsCrisisResponse)
    {
        startPage();
        List<SportsCrisisResponse> list = sportsCrisisResponseService.selectSportsCrisisResponseList(sportsCrisisResponse);
        return getDataTable(list);
    }

    /**
     * 导出安全与健康协议-危机响应列表
     */
    @Operation(summary = "导出安全与健康协议-危机响应列表")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:crisisResponse:export')")
    @Log(title = "安全与健康协议-危机响应", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsCrisisResponse sportsCrisisResponse)
    {
        List<SportsCrisisResponse> list = sportsCrisisResponseService.selectSportsCrisisResponseList(sportsCrisisResponse);
        ExcelUtil<SportsCrisisResponse> util = new ExcelUtil<SportsCrisisResponse>(SportsCrisisResponse.class);
        util.exportExcel(response, list, "安全与健康协议-危机响应数据");
    }

    /**
     * 获取安全与健康协议-危机响应详细信息
     */
    @Operation(summary = "获取安全与健康协议-危机响应详细信息")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:crisisResponse:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsCrisisResponseService.selectSportsCrisisResponseById(id));
    }

    /**
     * 新增安全与健康协议-危机响应
     */
    @Operation(summary = "新增安全与健康协议-危机响应")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:crisisResponse:add')")
    @Log(title = "安全与健康协议-危机响应", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsCrisisResponse sportsCrisisResponse)
    {
        return toAjax(sportsCrisisResponseService.insertSportsCrisisResponse(sportsCrisisResponse));
    }

    /**
     * 修改安全与健康协议-危机响应
     */
    @Operation(summary = "修改安全与健康协议-危机响应")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:crisisResponse:edit')")
    @Log(title = "安全与健康协议-危机响应", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsCrisisResponse sportsCrisisResponse)
    {
        return toAjax(sportsCrisisResponseService.updateSportsCrisisResponse(sportsCrisisResponse));
    }

    /**
     * 删除安全与健康协议-危机响应
     */
    @Operation(summary = "删除安全与健康协议-危机响应")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:crisisResponse:remove')")
    @Log(title = "安全与健康协议-危机响应", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsCrisisResponseService.deleteSportsCrisisResponseByIds(ids));
    }
}
