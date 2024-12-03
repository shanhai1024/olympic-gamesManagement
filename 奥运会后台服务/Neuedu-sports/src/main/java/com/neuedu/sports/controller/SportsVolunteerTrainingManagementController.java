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
import com.neuedu.sports.domain.SportsVolunteerTrainingManagement;
import com.neuedu.sports.service.ISportsVolunteerTrainingManagementService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 志愿者管理-培训管理Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/volunteer/trainingManagement")
@Tag(name = "【志愿者管理-培训管理】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerTrainingManagementController extends BaseController
{
    private final ISportsVolunteerTrainingManagementService sportsVolunteerTrainingManagementService;

    /**
     * 查询志愿者管理-培训管理列表
     */
    @Operation(summary = "查询志愿者管理-培训管理列表")
    @PreAuthorize("@ss.hasPermi('volunteer:trainingManagement:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        startPage();
        List<SportsVolunteerTrainingManagement> list = sportsVolunteerTrainingManagementService.selectSportsVolunteerTrainingManagementList(sportsVolunteerTrainingManagement);
        return getDataTable(list);
    }

    /**
     * 导出志愿者管理-培训管理列表
     */
    @Operation(summary = "导出志愿者管理-培训管理列表")
    @PreAuthorize("@ss.hasPermi('volunteer:trainingManagement:export')")
    @Log(title = "志愿者管理-培训管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        List<SportsVolunteerTrainingManagement> list = sportsVolunteerTrainingManagementService.selectSportsVolunteerTrainingManagementList(sportsVolunteerTrainingManagement);
        ExcelUtil<SportsVolunteerTrainingManagement> util = new ExcelUtil<SportsVolunteerTrainingManagement>(SportsVolunteerTrainingManagement.class);
        util.exportExcel(response, list, "志愿者管理-培训管理数据");
    }

    /**
     * 获取志愿者管理-培训管理详细信息
     */
    @Operation(summary = "获取志愿者管理-培训管理详细信息")
    @PreAuthorize("@ss.hasPermi('volunteer:trainingManagement:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsVolunteerTrainingManagementService.selectSportsVolunteerTrainingManagementById(id));
    }

    /**
     * 新增志愿者管理-培训管理
     */
    @Operation(summary = "新增志愿者管理-培训管理")
    @PreAuthorize("@ss.hasPermi('volunteer:trainingManagement:add')")
    @Log(title = "志愿者管理-培训管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        return toAjax(sportsVolunteerTrainingManagementService.insertSportsVolunteerTrainingManagement(sportsVolunteerTrainingManagement));
    }

    /**
     * 修改志愿者管理-培训管理
     */
    @Operation(summary = "修改志愿者管理-培训管理")
    @PreAuthorize("@ss.hasPermi('volunteer:trainingManagement:edit')")
    @Log(title = "志愿者管理-培训管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsVolunteerTrainingManagement sportsVolunteerTrainingManagement)
    {
        return toAjax(sportsVolunteerTrainingManagementService.updateSportsVolunteerTrainingManagement(sportsVolunteerTrainingManagement));
    }

    /**
     * 删除志愿者管理-培训管理
     */
    @Operation(summary = "删除志愿者管理-培训管理")
    @PreAuthorize("@ss.hasPermi('volunteer:trainingManagement:remove')")
    @Log(title = "志愿者管理-培训管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsVolunteerTrainingManagementService.deleteSportsVolunteerTrainingManagementByIds(ids));
    }
}
