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
import com.neuedu.sports.domain.SportsSafetyHealthProtocol;
import com.neuedu.sports.service.ISportsSafetyHealthProtocolService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 安全与健康协议Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/safeAndHealthy/healthyProtocol")
@Tag(name = "【安全与健康协议】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsSafetyHealthProtocolController extends BaseController
{
    private final ISportsSafetyHealthProtocolService sportsSafetyHealthProtocolService;

    /**
     * 查询安全与健康协议列表
     */
    @Operation(summary = "查询安全与健康协议列表")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:healthyProtocol:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        startPage();
        List<SportsSafetyHealthProtocol> list = sportsSafetyHealthProtocolService.selectSportsSafetyHealthProtocolList(sportsSafetyHealthProtocol);
        return getDataTable(list);
    }

    /**
     * 导出安全与健康协议列表
     */
    @Operation(summary = "导出安全与健康协议列表")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:healthyProtocol:export')")
    @Log(title = "安全与健康协议", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        List<SportsSafetyHealthProtocol> list = sportsSafetyHealthProtocolService.selectSportsSafetyHealthProtocolList(sportsSafetyHealthProtocol);
        ExcelUtil<SportsSafetyHealthProtocol> util = new ExcelUtil<SportsSafetyHealthProtocol>(SportsSafetyHealthProtocol.class);
        util.exportExcel(response, list, "安全与健康协议数据");
    }

    /**
     * 获取安全与健康协议详细信息
     */
    @Operation(summary = "获取安全与健康协议详细信息")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:healthyProtocol:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsSafetyHealthProtocolService.selectSportsSafetyHealthProtocolById(id));
    }

    /**
     * 新增安全与健康协议
     */
    @Operation(summary = "新增安全与健康协议")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:healthyProtocol:add')")
    @Log(title = "安全与健康协议", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        return toAjax(sportsSafetyHealthProtocolService.insertSportsSafetyHealthProtocol(sportsSafetyHealthProtocol));
    }

    /**
     * 修改安全与健康协议
     */
    @Operation(summary = "修改安全与健康协议")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:healthyProtocol:edit')")
    @Log(title = "安全与健康协议", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsSafetyHealthProtocol sportsSafetyHealthProtocol)
    {
        return toAjax(sportsSafetyHealthProtocolService.updateSportsSafetyHealthProtocol(sportsSafetyHealthProtocol));
    }

    /**
     * 删除安全与健康协议
     */
    @Operation(summary = "删除安全与健康协议")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:healthyProtocol:remove')")
    @Log(title = "安全与健康协议", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsSafetyHealthProtocolService.deleteSportsSafetyHealthProtocolByIds(ids));
    }
}
