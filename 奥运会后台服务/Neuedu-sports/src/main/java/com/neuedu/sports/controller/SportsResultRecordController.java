package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
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
import com.neuedu.sports.domain.SportsResultRecord;
import com.neuedu.sports.service.ISportsResultRecordService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

import javax.servlet.http.HttpServletResponse;

/**
 * 赛事管理-结果记录Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/competition/resultRecord")
@Tag(name = "【赛事管理-结果记录】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsResultRecordController extends BaseController
{
    private final ISportsResultRecordService sportsResultRecordService;

    /**
     * 查询赛事管理-结果记录列表
     */
    @Operation(summary = "查询赛事管理-结果记录列表")
    @PreAuthorize("@ss.hasPermi('competition:resultRecord:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsResultRecord sportsResultRecord)
    {
        startPage();
        List<SportsResultRecord> list = sportsResultRecordService.selectSportsResultRecordList(sportsResultRecord);
        return getDataTable(list);
    }

    /**
     * 导出赛事管理-结果记录列表
     */
    @Operation(summary = "导出赛事管理-结果记录列表")
    @PreAuthorize("@ss.hasPermi('competition:resultRecord:export')")
    @Log(title = "赛事管理-结果记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsResultRecord sportsResultRecord)
    {
        List<SportsResultRecord> list = sportsResultRecordService.selectSportsResultRecordList(sportsResultRecord);
        ExcelUtil<SportsResultRecord> util = new ExcelUtil<SportsResultRecord>(SportsResultRecord.class);
        util.exportExcel(response, list, "赛事管理-结果记录数据");
    }

    /**
     * 获取赛事管理-结果记录详细信息
     */
    @Operation(summary = "获取赛事管理-结果记录详细信息")
    @PreAuthorize("@ss.hasPermi('competition:resultRecord:query')")
    @GetMapping(value = "/{jie}")
    public AjaxResult getInfo(@PathVariable("jie") Long jie)
    {
        return success(sportsResultRecordService.selectSportsResultRecordByJie(jie));
    }

    /**
     * 新增赛事管理-结果记录
     */
    @Operation(summary = "新增赛事管理-结果记录")
    @PreAuthorize("@ss.hasPermi('competition:resultRecord:add')")
    @Log(title = "赛事管理-结果记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsResultRecord sportsResultRecord)
    {
        return toAjax(sportsResultRecordService.insertSportsResultRecord(sportsResultRecord));
    }

    /**
     * 修改赛事管理-结果记录
     */
    @Operation(summary = "修改赛事管理-结果记录")
    @PreAuthorize("@ss.hasPermi('competition:resultRecord:edit')")
    @Log(title = "赛事管理-结果记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsResultRecord sportsResultRecord)
    {
        return toAjax(sportsResultRecordService.updateSportsResultRecord(sportsResultRecord));
    }

    /**
     * 删除赛事管理-结果记录
     */
    @Operation(summary = "删除赛事管理-结果记录")
    @PreAuthorize("@ss.hasPermi('competition:resultRecord:remove')")
    @Log(title = "赛事管理-结果记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{jies}")
    public AjaxResult remove(@PathVariable( name = "jies" ) Long[] jies) 
    {
        return toAjax(sportsResultRecordService.deleteSportsResultRecordByJies(jies));
    }
}
