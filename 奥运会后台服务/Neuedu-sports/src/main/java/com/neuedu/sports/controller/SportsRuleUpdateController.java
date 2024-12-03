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
import com.neuedu.sports.domain.SportsRuleUpdate;
import com.neuedu.sports.service.ISportsRuleUpdateService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 赛事管理-规则更新Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/competition/ruleUpdate")
@Tag(name = "【赛事管理-规则更新】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsRuleUpdateController extends BaseController
{
    private final ISportsRuleUpdateService sportsRuleUpdateService;

    /**
     * 查询赛事管理-规则更新列表
     */
    @Operation(summary = "查询赛事管理-规则更新列表")
    @PreAuthorize("@ss.hasPermi('competition:ruleUpdate:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsRuleUpdate sportsRuleUpdate)
    {
        startPage();
        List<SportsRuleUpdate> list = sportsRuleUpdateService.selectSportsRuleUpdateList(sportsRuleUpdate);
        return getDataTable(list);
    }

    /**
     * 导出赛事管理-规则更新列表
     */
    @Operation(summary = "导出赛事管理-规则更新列表")
    @PreAuthorize("@ss.hasPermi('competition:ruleUpdate:export')")
    @Log(title = "赛事管理-规则更新", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsRuleUpdate sportsRuleUpdate)
    {
        List<SportsRuleUpdate> list = sportsRuleUpdateService.selectSportsRuleUpdateList(sportsRuleUpdate);
        ExcelUtil<SportsRuleUpdate> util = new ExcelUtil<SportsRuleUpdate>(SportsRuleUpdate.class);
        util.exportExcel(response, list, "赛事管理-规则更新数据");
    }

    /**
     * 获取赛事管理-规则更新详细信息
     */
    @Operation(summary = "获取赛事管理-规则更新详细信息")
    @PreAuthorize("@ss.hasPermi('competition:ruleUpdate:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsRuleUpdateService.selectSportsRuleUpdateById(id));
    }

    /**
     * 新增赛事管理-规则更新
     */
    @Operation(summary = "新增赛事管理-规则更新")
    @PreAuthorize("@ss.hasPermi('competition:ruleUpdate:add')")
    @Log(title = "赛事管理-规则更新", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsRuleUpdate sportsRuleUpdate)
    {
        return toAjax(sportsRuleUpdateService.insertSportsRuleUpdate(sportsRuleUpdate));
    }

    /**
     * 修改赛事管理-规则更新
     */
    @Operation(summary = "修改赛事管理-规则更新")
    @PreAuthorize("@ss.hasPermi('competition:ruleUpdate:edit')")
    @Log(title = "赛事管理-规则更新", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsRuleUpdate sportsRuleUpdate)
    {
        return toAjax(sportsRuleUpdateService.updateSportsRuleUpdate(sportsRuleUpdate));
    }

    /**
     * 删除赛事管理-规则更新
     */
    @Operation(summary = "删除赛事管理-规则更新")
    @PreAuthorize("@ss.hasPermi('competition:ruleUpdate:remove')")
    @Log(title = "赛事管理-规则更新", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsRuleUpdateService.deleteSportsRuleUpdateByIds(ids));
    }
}
