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
import com.neuedu.sports.domain.SportsSafetyPlanning;
import com.neuedu.sports.service.ISportsSafetyPlanningService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 安全与健康协议-安全规划Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/safeAndHealthy/safetyPlanning")
@Tag(name = "【安全与健康协议-安全规划】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsSafetyPlanningController extends BaseController
{
    private final ISportsSafetyPlanningService sportsSafetyPlanningService;

    /**
     * 查询安全与健康协议-安全规划列表
     */
    @Operation(summary = "查询安全与健康协议-安全规划列表")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:safetyPlanning:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsSafetyPlanning sportsSafetyPlanning)
    {
        startPage();
        List<SportsSafetyPlanning> list = sportsSafetyPlanningService.selectSportsSafetyPlanningList(sportsSafetyPlanning);
        return getDataTable(list);
    }

    /**
     * 导出安全与健康协议-安全规划列表
     */
    @Operation(summary = "导出安全与健康协议-安全规划列表")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:safetyPlanning:export')")
    @Log(title = "安全与健康协议-安全规划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsSafetyPlanning sportsSafetyPlanning)
    {
        List<SportsSafetyPlanning> list = sportsSafetyPlanningService.selectSportsSafetyPlanningList(sportsSafetyPlanning);
        ExcelUtil<SportsSafetyPlanning> util = new ExcelUtil<SportsSafetyPlanning>(SportsSafetyPlanning.class);
        util.exportExcel(response, list, "安全与健康协议-安全规划数据");
    }

    /**
     * 获取安全与健康协议-安全规划详细信息
     */
    @Operation(summary = "获取安全与健康协议-安全规划详细信息")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:safetyPlanning:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsSafetyPlanningService.selectSportsSafetyPlanningById(id));
    }

    /**
     * 新增安全与健康协议-安全规划
     */
    @Operation(summary = "新增安全与健康协议-安全规划")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:safetyPlanning:add')")
    @Log(title = "安全与健康协议-安全规划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsSafetyPlanning sportsSafetyPlanning)
    {
        return toAjax(sportsSafetyPlanningService.insertSportsSafetyPlanning(sportsSafetyPlanning));
    }

    /**
     * 修改安全与健康协议-安全规划
     */
    @Operation(summary = "修改安全与健康协议-安全规划")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:safetyPlanning:edit')")
    @Log(title = "安全与健康协议-安全规划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsSafetyPlanning sportsSafetyPlanning)
    {
        return toAjax(sportsSafetyPlanningService.updateSportsSafetyPlanning(sportsSafetyPlanning));
    }

    /**
     * 删除安全与健康协议-安全规划
     */
    @Operation(summary = "删除安全与健康协议-安全规划")
    @PreAuthorize("@ss.hasPermi('safeAndHealthy:safetyPlanning:remove')")
    @Log(title = "安全与健康协议-安全规划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsSafetyPlanningService.deleteSportsSafetyPlanningByIds(ids));
    }
}
