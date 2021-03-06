#
# Module 'Dynamite.PowerShell.Toolkit'
# Generated by: GSoft, Team Dynamite.
# Generated on: 10/24/2013
# > GSoft & Dynamite : http://www.gsoft.com
# > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
# > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
#

#region Imports PowerShell Scripts
# Get the current Path
 $currentPath = split-path -parent $MyInvocation.MyCommand.Definition
 Get-ChildItem -Path $currentPath\*.ps1 | Foreach-Object{ . $_.FullName }
#endregion

<#
    .SYNOPSIS
        Get The Version of the Dynamite PowerShell Toolkit

    .DESCRIPTION
        Get The Version of the Dynamite PowerShell Toolkit
    
    --------------------------------------------------------------------------------------
    Module 'Dynamite.PowerShell.Toolkit'
    by: GSoft, Team Dynamite.
    > GSoft & Dynamite : http://www.gsoft.com
    > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    --------------------------------------------------------------------------------------
    
    .EXAMPLE
        PS C:\> Get-DSPVersion
        
    .OUTPUTS
        Name and Version Properties

    .NOTES
        The version should be incremented and the Changelog should be updated

#>
function Get-DSPVersion {
    return GetDSPModule | Select Name, Version
}

<#
    .SYNOPSIS
        Get The name of the Dynamite PowerShell Toolkit module

    .DESCRIPTION
        Get The name of the Dynamite PowerShell Toolkit module

    --------------------------------------------------------------------------------------
    Module 'Dynamite.PowerShell.Toolkit'
    by: GSoft, Team Dynamite.
    > GSoft & Dynamite : http://www.gsoft.com
    > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    --------------------------------------------------------------------------------------
    
    .EXAMPLE
        PS C:\> Get-DSPModuleName
        
    .OUTPUTS
        System.String

    .NOTES
        It's dynamic, the command is going to get the name from the imported module

#>
function Get-DSPModuleName {
    return $($MyInvocation.MyCommand.Module | Select-Object Name).Name
}

function GetDSPModule {
    return $MyInvocation.MyCommand.Module
}

#region Export-ModuleMember

# Dynamite PowerShell Toolkit function
Export-ModuleMember -Function Get-DSPVersion, Get-DSPModuleName

# Database
Export-ModuleMember -Function New-DSPContentDatabase

# PropertyBag
Export-ModuleMember -Function Get-DSPWebAppProperty, Set-DSPWebAppProperty, Set-DSPWebProperty, Get-DSPWebProperty

# Search - Managed Properties
Export-ModuleMember -Function Add-DSPMetadataManagedPropertiesByXml, Remove-DSPMetadataManagedPropertiesByXml, Remove-DSPMetadataManagedPropertiesByKeyword, Add-DSPCrawlExtension, Start-DSPContentSourceCrawl, Wait-DSPContentSourceCrawl, <#New-DSPResultSources,#> Set-DSPResultTypesByXml <#, New-DSPQueryRules#>

# SiteCollection - Structure
Export-ModuleMember -Function New-DSPStructure, Remove-DSPStructure, New-SuggestedBrowserContentLocations

# Tokenizer
Export-ModuleMember -Function Update-DSPTokens, Initialize-DSPTokens

# Taxonomy
Export-ModuleMember -Function Get-DSPTaxonomySession, Get-DSPTermStore, Get-DSPTermSet, New-DSPTaxonomyField, Set-DSPTaxonomyField, Set-DSPTaxonomyTerms, Set-DSPTaxonomyFieldMultiValue, Set-DSPTaxonomyFieldValue, Remove-DSPTermGroup, ConvertTo-DSPTaxonomyStructure

# Features
Export-ModuleMember Initialize-DSPFarmFeatures, Initialize-DSPWebApplicationFeatures, Initialize-DSPSiteCollectionsFeatures, Initialize-DSPSiteAllWebsFeatures, Initialize-DSPWebFeatures, Initialize-DSPFeatures, Initialize-DSPFeature

# Managed Paths
Export-ModuleMember New-DSPManagedPath

# Taxonomy Navigation Settings
Export-ModuleMember New-DSPTaxonomyNavigationSettings

# Variations
Export-ModuleMember New-DSPSiteVariations, Sync-DSPList, Sync-DSPItem, Start-ListItemPropagation, Sync-DSPWeb, Set-VariationHierarchy, Get-VariationLabels, Get-VariationPeerWeb

# Administration
Export-ModuleMember Wait-SPTimerJob, Restart-SPTimer, Enable-DSPEmailRecipientOverride, Disable-DSPEmailRecipientOverride

# List
Export-ModuleMember Add-DSPFile, Set-DSPAlerts, Add-DSPAlert

# Data
Export-ModuleMember Add-DSPSampleContent, Add-DSPReusableContentSnippets

# Web
Export-ModuleMember New-DSPWebXml, Set-DSPWebSearchSettings, Export-DSPWebStructure, Import-DSPWebStructure, Remove-DSPWeb, Get-DSPWeb

# User Profile 
Export-ModuleMember Set-DSPUserProfileSchema

# Excel
Export-ModuleMember Merge-DSPExcelColumns, Remove-DSPExcelColumn, Copy-DSPExcelColumn , Add-DSPExcelColumn , Edit-DSPExcelColumnValue, Get-DSPExcelFileContent, Open-DSPExcelFile, Find-DSPExcelFiles, Rename-DSPExcelColumn

# Faceted Search
Export-ModuleMember New-DSPFacetedSearchSettings

# Workflow 
Export-ModuleMember Set-DSPListWorkflows

# Blob Cache 
Export-ModuleMember Enable-DSPBlobCache, Disable-DSPBlobCache, Clear-DSPBlobCache

# Security 
Export-ModuleMember Set-DSPWebPermissions

# Sharegate
Export-ModuleMember  Test-SharegateModule, Import-DSPData, Copy-DSPData

# Timer Job
Export-ModuleMember Set-DSPTimerJobs

# Utilities
Export-ModuleMember New-HeaderDrawing, Test-DSPIsAdmin, Copy-DSPFiles, Copy-DSPFile, Copy-DSPSolutions, Test-DSPDeployedSolutions, Resolve-DSPType, Invoke-GenericMethod

# Remote
Export-ModuleMember Add-DSPTrustedHosts, Get-DSPTrustedHosts, Initialize-DSPRemotePowerShell, Enter-DSPRemoteSession

#Logging
Export-ModuleMember Start-DSPLogging, Stop-DSPLogging

# Multithreading
Export-ModuleMember Invoke-Parallel

# Pester Tests
Export-ModuleMember New-SingleSiteNoSubsitesNoVariationsWithCustomLists, New-SingleSiteNoSubsitesNoVariationsWithoutCustomLists, New-SiteWithSubsitesNoVariations, New-SiteWithSubsitesAndVariationsWithCustomLists,
 New-CustomList, Get-ListItem, New-SinglePublishingSiteNoSubsitesNoVariationsWithPagesAndFolders, New-TeamSiteWithSubSites, New-PublishingSiteWithSubsitesNoVariationsWithPagesAndFolders, New-PublishingSiteWithSubsitesWithVariationsWithPagesAndFolders, Add-Document, New-PublishingPagesAndFolders, New-SingleSite

#endregion