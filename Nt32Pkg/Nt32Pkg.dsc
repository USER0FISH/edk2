#/** @file
# EFI/Framework Emulation Platform
#
# The Emulation Platform can be used to debug individual modules, prior to creating
#    a real platform. This also provides an example for how an FPD is created.
#
# Copyright (c) 2006 - 2007, Intel Corporation
#
#  All rights reserved. This program and the accompanying materials
#    are licensed and made available under the terms and conditions of the BSD License
#    which accompanies this distribution. The full text of the license may be found at
#    http://opensource.org/licenses/bsd-license.php
#
#    THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#    WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
#**/

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = NT32
  PLATFORM_GUID                  = EB216561-961F-47EE-9EF9-CA426EF547C2
  PLATFORM_VERSION               = 0.3
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = $(WORKSPACE)/Build/Nt32Platform
  SUPPORTED_ARCHITECTURES        = IA32
  BUILD_TARGETS                  = DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = $(WORKSPACE)/Nt32Pkg/Nt32Pkg.fdf

  DEBUG_ICC_IA32_DLINK_FLAGS                  = /EXPORT:InitializeDriver=_ModuleEntryPoint /ALIGN:4096 /SUBSYSTEM:CONSOLE
  DEBUG_VS2003_IA32_DLINK_FLAGS               = /EXPORT:InitializeDriver=_ModuleEntryPoint /ALIGN:4096 /SUBSYSTEM:CONSOLE
  DEBUG_MYTOOLS_IA32_DLINK_FLAGS              = /EXPORT:InitializeDriver=_ModuleEntryPoint /ALIGN:4096 /SUBSYSTEM:CONSOLE
  DEBUG_WINDDK3790x1830_IA32_DLINK_FLAGS      = /EXPORT:InitializeDriver=_ModuleEntryPoint /ALIGN:4096 /SUBSYSTEM:CONSOLE
  DEBUG_VS2005PRO_IA32_DLINK_FLAGS            = /EXPORT:InitializeDriver=_ModuleEntryPoint /ALIGN:4096 /SUBSYSTEM:CONSOLE
  DEBUG_MIXED_IA32_DLINK_FLAGS                = /EXPORT:InitializeDriver=_ModuleEntryPoint /ALIGN:4096 /SUBSYSTEM:CONSOLE
  RELEASE_ICC_IA32_DLINK_FLAGS                = /ALIGN:4096
  RELEASE_VS2003_IA32_DLINK_FLAGS             = /ALIGN:4096
  RELEASE_MYTOOLS_IA32_DLINK_FLAGS            = /ALIGN:4096
  RELEASE_WINDDK3790x1830_IA32_DLINK_FLAGS    = /ALIGN:4096
  RELEASE_VS2005PRO_IA32_DLINK_FLAGS          = /ALIGN:4096
  RELEASE_MIXED_IA32_DLINK_FLAGS              = /ALIGN:4096

################################################################################
#
# SKU Identification section - list of all SKU IDs supported by this
#                              Platform.
#
################################################################################
[SkuIds]
  0|DEFAULT              # The entry: 0|DEFAULT is reserved and always required.

################################################################################
#
# Library Class section - list of all Library Classes needed by this Platform.
#
################################################################################

[LibraryClasses.common]
  TimerLib|$(WORKSPACE)/MdePkg/Library/BaseTimerLibNullTemplate/BaseTimerLibNullTemplate.inf
  PrintLib|$(WORKSPACE)/MdePkg/Library/BasePrintLib/BasePrintLib.inf
  DebugLib|$(WORKSPACE)/IntelFrameworkPkg/Library/PeiDxeDebugLibReportStatusCode/PeiDxeDebugLibReportStatusCode.inf
  SerialPortLib|$(WORKSPACE)/MdePkg/Library/SerialPortLibNull/SerialPortLibNull.inf
  BaseMemoryLib|$(WORKSPACE)/MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  BaseLib|$(WORKSPACE)/MdePkg/Library/BaseLib/BaseLib.inf
  PerformanceLib|$(WORKSPACE)/MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  PeCoffLib|$(WORKSPACE)/MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  PciIncompatibleDeviceSupportLib|${WORKSPACE}/IntelFrameworkModulePkg/Library/PciIncompatibleDeviceSupportLib/PciIncompatibleDeviceSupportLib.inf
  CacheMaintenanceLib|$(WORKSPACE)/MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf
  IfrSupportLibFramework|$(WORKSPACE)/IntelFrameworkPkg/Library/IfrSupportLibFramework/IfrSupportLib.inf
  GraphicsLib|$(WORKSPACE)/IntelFrameworkModulePkg/Library/GraphicsLib/GraphicsLib.inf
  FvbServiceLib|${WORKSPACE}/MdeModulePkg/Library/EdkFvbServiceLib/EdkFvbServiceLib.inf
  IoLib|$(WORKSPACE)/MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  CustomDecompressLib|${WORKSPACE}/IntelFrameworkModulePkg/Library/BaseUefiTianoCustomDecompressLib/BaseUefiTianoCustomDecompressLib.inf   
  HiiLib|${WORKSPACE}/IntelFrameworkPkg/Library/HiiLibFramework/HiiLib.inf

[LibraryClasses.common.DXE_CORE]
  DevicePathLib|$(WORKSPACE)/MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  UefiDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreUefiDecompressLibFromHob/DxeCoreUefiDecompressLibFromHob.inf
  UefiBootServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  HobLib|$(WORKSPACE)/MdePkg/Library/DxeCoreHobLib/DxeCoreHobLib.inf
  DxeCoreEntryPoint|$(WORKSPACE)/MdePkg/Library/DxeCoreEntryPoint/DxeCoreEntryPoint.inf
  CustomDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreCustomDecompressLibFromHob/DxeCoreCustomDecompressLibFromHob.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/DxeMemoryAllocationLib/DxeMemoryAllocationLib.inf
  UefiLib|$(WORKSPACE)/MdePkg/Library/UefiLib/UefiLib.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  PeCoffLoaderLib|$(WORKSPACE)/Nt32Pkg/Library/Nt32PeCoffLoaderLib/Nt32PeCoffLoaderLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf
  UefiRuntimeServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf


[LibraryClasses.common.DXE_SMM_DRIVER]
  DxeServicesTableLib|$(WORKSPACE)/MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  ScsiLib|$(WORKSPACE)/MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  UefiDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreUefiDecompressLibFromHob/DxeCoreUefiDecompressLibFromHob.inf
  HiiLibFramework|$(WORKSPACE)/IntelFrameworkPkg/Library/HiiLibFramework/HiiLib.inf
  UefiBootServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  HobLib|$(WORKSPACE)/MdePkg/Library/DxeHobLib/DxeHobLib.inf
  DevicePathLib|$(WORKSPACE)/MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/DxeMemoryAllocationLib/DxeMemoryAllocationLib.inf
  UefiLib|$(WORKSPACE)/MdePkg/Library/UefiLib/UefiLib.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  UefiRuntimeServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  WinNtLib|$(WORKSPACE)/Nt32Pkg/Library/DxeWinNtLib/DxeWinNtLib.inf
  OemHookStatusCodeLib|$(WORKSPACE)/Nt32Pkg/Library/DxeNt32OemHookStatusCodeLib/DxeNt32OemHookStatusCodeLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf

[LibraryClasses.common.PEIM]
  HobLib|$(WORKSPACE)/MdePkg/Library/PeiHobLib/PeiHobLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/PeiPcdLib/PeiPcdLib.inf
  IoLib|$(WORKSPACE)/MdePkg/Library/PeiIoLibCpuIo/PeiIoLibCpuIo.inf
  PeimEntryPoint|$(WORKSPACE)/MdePkg/Library/PeimEntryPoint/PeimEntryPoint.inf
  PeiServicesLib|$(WORKSPACE)/MdePkg/Library/PeiServicesLib/PeiServicesLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/PeiReportStatusCodeLib/PeiReportStatusCodeLib.inf
  PeCoffLoaderLib|$(WORKSPACE)/Nt32Pkg/Library/Nt32PeCoffLoaderLib/Nt32PeCoffLoaderLib.inf
  PeiServicesTablePointerLib|$(WORKSPACE)/MdePkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf
  OemHookStatusCodeLib|$(WORKSPACE)/Nt32Pkg/Library/PeiNt32OemHookStatusCodeLib/PeiNt32OemHookStatusCodeLib.inf
  PeCoffGetEntryPointLib|$(WORKSPACE)/Nt32Pkg/Library/EdkNt32PeiPeCoffGetEntryPointLib/EdkNt32PeiPeCoffGetEntryPointLib.inf

[LibraryClasses.common.PEI_CORE]
  HobLib|$(WORKSPACE)/MdePkg/Library/PeiHobLib/PeiHobLib.inf
  PeiServicesTablePointerLib|$(WORKSPACE)/MdePkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf
  IoLib|$(WORKSPACE)/MdePkg/Library/PeiIoLibCpuIo/PeiIoLibCpuIo.inf
  PeiServicesLib|$(WORKSPACE)/MdePkg/Library/PeiServicesLib/PeiServicesLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  PeiCoreEntryPoint|$(WORKSPACE)/MdePkg/Library/PeiCoreEntryPoint/PeiCoreEntryPoint.inf
  OldPeiCoreEntryPoint|$(WORKSPACE)/MdePkg/Library/OldPeiCoreEntryPoint/OldPeiCoreEntryPoint.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/PeiReportStatusCodeLib/PeiReportStatusCodeLib.inf
  PeCoffGetEntryPointLib|$(WORKSPACE)/Nt32Pkg/Library/EdkNt32PeiPeCoffGetEntryPointLib/EdkNt32PeiPeCoffGetEntryPointLib.inf
 PcdLib|$(WORKSPACE)/MdePkg/Library/PeiPcdLib/PeiPcdLib.inf

[LibraryClasses.common.DXE_RUNTIME_DRIVER]
  UefiRuntimeServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  HobLib|$(WORKSPACE)/MdePkg/Library/DxeHobLib/DxeHobLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/DxeMemoryAllocationLib/DxeMemoryAllocationLib.inf
  UefiLib|$(WORKSPACE)/MdePkg/Library/UefiLib/UefiLib.inf
  UefiDriverEntryPoint|$(WORKSPACE)/MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  DxeServicesTableLib|$(WORKSPACE)/MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  UefiDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreUefiDecompressLibFromHob/DxeCoreUefiDecompressLibFromHob.inf
  HiiLibFramework|$(WORKSPACE)/IntelFrameworkPkg/Library/HiiLibFramework/HiiLib.inf
  UefiBootServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  DevicePathLib|$(WORKSPACE)/MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  UefiRuntimeLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  ScsiLib|$(WORKSPACE)/MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  UefiDriverModelLib|$(WORKSPACE)/MdePkg/Library/UefiDriverModelLib/UefiDriverModelLib.inf
  WinNtLib|$(WORKSPACE)/Nt32Pkg/Library/DxeWinNtLib/DxeWinNtLib.inf
  OemHookStatusCodeLib|$(WORKSPACE)/Nt32Pkg/Library/DxeNt32OemHookStatusCodeLib/DxeNt32OemHookStatusCodeLib.inf

[LibraryClasses.common.UEFI_DRIVER]
  UefiRuntimeServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  HobLib|$(WORKSPACE)/MdePkg/Library/DxeHobLib/DxeHobLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/DxeMemoryAllocationLib/DxeMemoryAllocationLib.inf
  UefiLib|$(WORKSPACE)/MdePkg/Library/UefiLib/UefiLib.inf
  UefiDriverEntryPoint|$(WORKSPACE)/MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  DxeServicesTableLib|$(WORKSPACE)/MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  UefiDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreUefiDecompressLibFromHob/DxeCoreUefiDecompressLibFromHob.inf
  HiiLibFramework|$(WORKSPACE)/IntelFrameworkPkg/Library/HiiLibFramework/HiiLib.inf
  UefiBootServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  DevicePathLib|$(WORKSPACE)/MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  ScsiLib|$(WORKSPACE)/MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  UefiDriverModelLib|$(WORKSPACE)/MdePkg/Library/UefiDriverModelLib/UefiDriverModelLib.inf
  WinNtLib|$(WORKSPACE)/Nt32Pkg/Library/DxeWinNtLib/DxeWinNtLib.inf
  OemHookStatusCodeLib|$(WORKSPACE)/Nt32Pkg/Library/DxeNt32OemHookStatusCodeLib/DxeNt32OemHookStatusCodeLib.inf

[LibraryClasses.common.DXE_DRIVER]
  UefiRuntimeServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  HobLib|$(WORKSPACE)/MdePkg/Library/DxeHobLib/DxeHobLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/DxeMemoryAllocationLib/DxeMemoryAllocationLib.inf
  UefiLib|$(WORKSPACE)/MdePkg/Library/UefiLib/UefiLib.inf
  UefiDriverEntryPoint|$(WORKSPACE)/MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  DxeServicesTableLib|$(WORKSPACE)/MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  UefiDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreUefiDecompressLibFromHob/DxeCoreUefiDecompressLibFromHob.inf
  HiiLibFramework|$(WORKSPACE)/IntelFrameworkPkg/Library/HiiLibFramework/HiiLib.inf
  UefiBootServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  DevicePathLib|$(WORKSPACE)/MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  ScsiLib|$(WORKSPACE)/MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  UefiDriverModelLib|$(WORKSPACE)/MdePkg/Library/UefiDriverModelLib/UefiDriverModelLib.inf
  WinNtLib|$(WORKSPACE)/Nt32Pkg/Library/DxeWinNtLib/DxeWinNtLib.inf
  OemHookStatusCodeLib|$(WORKSPACE)/Nt32Pkg/Library/DxeNt32OemHookStatusCodeLib/DxeNt32OemHookStatusCodeLib.inf
  EdkGenericBdsLib|$(WORKSPACE)/Nt32Pkg/Library/EdkGenericBdsLib/EdkGenericBdsLib.inf

[LibraryClasses.common.UEFI_APPLICATION]
  DxeServicesTableLib|$(WORKSPACE)/MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  ScsiLib|$(WORKSPACE)/MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  UefiDecompressLib|$(WORKSPACE)/MdeModulePkg/Library/DxeCoreUefiDecompressLibFromHob/DxeCoreUefiDecompressLibFromHob.inf
  HiiLibFramework|$(WORKSPACE)/IntelFrameworkPkg/Library/HiiLibFramework/HiiLib.inf
  UefiApplicationEntryPoint|$(WORKSPACE)/MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  UefiBootServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  HobLib|$(WORKSPACE)/MdePkg/Library/DxeHobLib/DxeHobLib.inf
  DevicePathLib|$(WORKSPACE)/MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  EdkIfrSupportLib|$(WORKSPACE)/MdeModulePkg/Library/EdkIfrSupportLib/EdkIfrSupportLib.inf
  PcdLib|$(WORKSPACE)/MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MemoryAllocationLib|$(WORKSPACE)/MdePkg/Library/DxeMemoryAllocationLib/DxeMemoryAllocationLib.inf
  UefiLib|$(WORKSPACE)/MdePkg/Library/UefiLib/UefiLib.inf
  ReportStatusCodeLib|$(WORKSPACE)/IntelFrameworkPkg/Library/DxeReportStatusCodeLibFramework/DxeReportStatusCodeLib.inf
  UefiRuntimeServicesTableLib|$(WORKSPACE)/MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  WinNtLib|$(WORKSPACE)/Nt32Pkg/Library/DxeWinNtLib/DxeWinNtLib.inf
  OemHookStatusCodeLib|$(WORKSPACE)/Nt32Pkg/Library/DxeNt32OemHookStatusCodeLib/DxeNt32OemHookStatusCodeLib.inf


################################################################################
#
# Pcd Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################

[PcdsFeatureFlag.common]
  PcdDevicePathSupportDevicePathFromText|gEfiEdkModulePkgTokenSpaceGuid|FALSE
  PcdDevicePathSupportDevicePathToText|gEfiEdkModulePkgTokenSpaceGuid|FALSE
  PcdDxeIplSupportCustomDecompress|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplBuildShareCodeHobs|gEfiEdkModulePkgTokenSpaceGuid|FALSE  
  PcdDxeIplSupportEfiDecompress|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplSupportTianoDecompress|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplSupportCustomDecompress|gEfiEdkModulePkgTokenSpaceGuid|TRUE  

[PcdsPatchableInModule.IA32]
  PcdStatusCodeMemorySize|gEfiIntelFrameworkModulePkgTokenSpaceGuid|1
  PcdStatusCodeRuntimeMemorySize|gEfiIntelFrameworkModulePkgTokenSpaceGuid|128

[PcdsFixedAtBuild.IA32]
  PcdWinNtMemorySizeForSecMain|gEfiNt32PkgTokenSpaceGuid|L"64!64"|10
  PcdWinNtFirmwareVolume|gEfiNt32PkgTokenSpaceGuid|L"..\\Fv\\Fv_Recovery.fd"|52
  PcdWinNtBootMode|gEfiNt32PkgTokenSpaceGuid|1
  PcdMaximumUnicodeStringLength|gEfiMdePkgTokenSpaceGuid|1000000
  PcdMaximumAsciiStringLength|gEfiMdePkgTokenSpaceGuid|1000000
  PcdMaximumLinkedListLength|gEfiMdePkgTokenSpaceGuid|1000000
  PcdSpinLockTimeout|gEfiMdePkgTokenSpaceGuid|10000000
  PcdMaximumAsciiStringLength|gEfiMdePkgTokenSpaceGuid|1000000
  PcdMaximumLinkedListLength|gEfiMdePkgTokenSpaceGuid|1000000
  PcdSpinLockTimeout|gEfiMdePkgTokenSpaceGuid|10000000
  PcdReportStatusCodePropertyMask|gEfiMdePkgTokenSpaceGuid|0x06
  PcdDebugPropertyMask|gEfiMdePkgTokenSpaceGuid|0x1f
  PcdDebugClearMemoryValue|gEfiMdePkgTokenSpaceGuid|0xAF
  PcdDebugPrintErrorLevel|gEfiMdePkgTokenSpaceGuid|0x80000040
  PcdPerformanceLibraryPropertyMask|gEfiMdePkgTokenSpaceGuid|0
  PcdMaxPeiPcdCallBackNumberPerPcdEntry|gEfiMdeModulePkgTokenSpaceGuid|0x08
  PcdVpdBaseAddress|gEfiEdkModulePkgTokenSpaceGuid|0x0
  PcdMaxSizeNonPopulateCapsule|gEfiEdkModulePkgTokenSpaceGuid|0x0
  PcdMaxSizePopulateCapsule|gEfiEdkModulePkgTokenSpaceGuid|0x0
  PcdPciIncompatibleDeviceSupportMask|gEfiIntelFrameworkModulePkgTokenSpaceGuid|0

[PcdsFeatureFlag.IA32]
  PcdPeiPcdDatabaseTraverseEnabled|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdPeiPcdDatabaseCallbackOnSetEnabled|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdPeiPcdDatabaseExEnabled|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdPeiPcdDatabaseGetSizeEnabled|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdPeiPcdDatabaseSetEnabled|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdStatusCodeUseSerial|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeUseMemory|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeUseOEM|gEfiIntelFrameworkModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplSwitchToLongMode|gEfiMdeModulePkgTokenSpaceGuid|FALSE
  PcdDxeIplSupportEfiDecompress|gEfiMdeModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplSupportTianoDecompress|gEfiMdeModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplSupportCustomDecompress|gEfiMdeModulePkgTokenSpaceGuid|TRUE
  PcdDxeIplBuildShareCodeHobs|gEfiMdeModulePkgTokenSpaceGuid|TRUE
  PcdDxePcdDatabaseTraverseEnabled|gEfiEdkModulePkgTokenSpaceGuid|TRUE
  PcdStatusCodeUseHardSerial|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeUseEfiSerial|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeUseRuntimeMemory|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeUseDataHub|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeUseOEM|gEfiIntelFrameworkModulePkgTokenSpaceGuid|TRUE
  PcdStatusCodeReplayInSerial|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeReplayInDataHub|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeReplayInRuntimeMemory|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdStatusCodeReplayInOEM|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdSupportUpdateCapsuleRest|gEfiMdeModulePkgTokenSpaceGuid|FALSE
  PcdComponentNameDisable|gEfiMdePkgTokenSpaceGuid|FALSE
  PcdDriverDiagnosticsDisable|gEfiMdePkgTokenSpaceGuid|FALSE
  PcdNtEmulatorEnable|gEfiMdeModulePkgTokenSpaceGuid|FALSE
  PcdDevicePathSupportDevicePathToText|gEfiMdeModulePkgTokenSpaceGuid|TRUE
  PcdDevicePathSupportDevicePathFromText|gEfiMdeModulePkgTokenSpaceGuid|TRUE
  PcdPciBusHotplugDeviceSupport|gEfiGenericPlatformTokenSpaceGuid|TRUE
  PcdComponentName2Disable|gEfiMdePkgTokenSpaceGuid|TRUE
  PcdUefiLibMaxPrintBufferSize|gEfiMdePkgTokenSpaceGuid|320
  PcdDriverDiagnostics2Disable|gEfiMdePkgTokenSpaceGuid|TRUE
  PcdSupportUpdateCapsuleRest|gEfiEdkModulePkgTokenSpaceGuid|FALSE
  PcdPciIsaEnable|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdPciVgaEnable|gEfiIntelFrameworkModulePkgTokenSpaceGuid|FALSE
  PcdPciBusHotplugDeviceSupport|gEfiIntelFrameworkModulePkgTokenSpaceGuid|TRUE
  PcdStatusCodeValueEfiWatchDogTimerExpired|gEfiMdePkgTokenSpaceGuid|0x00011003
  PcdStatusCodeValueMemoryTestStarted|gEfiMdePkgTokenSpaceGuid|0x00051006
  PcdStatusCodeValueSetVirtualAddressMap|gEfiMdePkgTokenSpaceGuid|0x03101004
  PcdStatusCodeValueUncorrectableMemoryError|gEfiMdePkgTokenSpaceGuid|0x00051003



################################################################################
#
# Pcd Dynamic Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################

[PcdsDynamic.common.DEFAULT]
  PcdFlashNvStorageFtwSpareBase|gEfiGenericPlatformTokenSpaceGuid|0x0
  PcdFlashNvStorageVariableSize|gEfiGenericPlatformTokenSpaceGuid|0x0
  PcdWinNtCpuSpeed|gEfiNt32PkgTokenSpaceGuid|L"3000"|8
  PcdFlashNvStorageVariableBase|gEfiGenericPlatformTokenSpaceGuid|0x0
  PcdWinNtSerialPort|gEfiNt32PkgTokenSpaceGuid|L"COM1!COM2"|18
  PcdWinNtFileSystem|gEfiNt32PkgTokenSpaceGuid|L".!..\\..\\..\\..\\EdkShellBinPkg\\bin\\ia32\\Apps"|106
  PcdFlashNvStorageFtwWorkingSize|gEfiGenericPlatformTokenSpaceGuid|0x0
  PcdWinNtGop|gEfiNt32PkgTokenSpaceGuid|L"UGA Window 1!UGA Window 2"|50
  PcdWinNtConsole|gEfiNt32PkgTokenSpaceGuid|L"Bus Driver Console Window"|50
  PcdFlashNvStorageFtwWorkingBase|gEfiGenericPlatformTokenSpaceGuid|0x0
  PcdWinNtMemorySize|gEfiNt32PkgTokenSpaceGuid|L"64!64"|10
  PcdWinNtVirtualDisk|gEfiNt32PkgTokenSpaceGuid|L"FW;40960;512"|24
  PcdWinNtCpuModel|gEfiNt32PkgTokenSpaceGuid|L"Intel(R) Processor Model"|48
  PcdWinNtPhysicalDisk|gEfiNt32PkgTokenSpaceGuid|L"E:RW;245760;512"|30
  PcdFlashNvStorageFtwSpareSize|gEfiGenericPlatformTokenSpaceGuid|0x0
  PcdWinNtUga|gEfiNt32PkgTokenSpaceGuid|L"UGA Window 1!UGA Window 2"|50

################################################################################
#
# Components Section - list of all EDK II Modules needed by this Platform
#
################################################################################

[Components.IA32]
  $(WORKSPACE)/Nt32Pkg/BootModePei/BootMode.inf
  $(WORKSPACE)/Nt32Pkg/WinNtThunkDxe/WinNtThunk.inf
  $(WORKSPACE)/Nt32Pkg/MiscSubClassPlatformDxe/MiscSubclassDriver.inf
  $(WORKSPACE)/Nt32Pkg/WinNtThunkPPIToProtocolPei/WinNtThunkPPIToProtocol.inf
  $(WORKSPACE)/Nt32Pkg/WinNtAutoScanPei/WinNtAutoScan.inf
  $(WORKSPACE)/Nt32Pkg/WinNtBlockIoDxe/WinNtBlockIo.inf
  $(WORKSPACE)/Nt32Pkg/WinNtBusDriverDxe/WinNtBusDriver.inf
  $(WORKSPACE)/Nt32Pkg/WinNtConsoleDxe/WinNtConsole.inf
  $(WORKSPACE)/Nt32Pkg/WinNtSimpleFileSystemDxe/WinNtSimpleFileSystem.inf
  $(WORKSPACE)/Nt32Pkg/WinNtGopDxe/WinNtGop.inf
  $(WORKSPACE)/Nt32Pkg/WinNtSerialIoDxe/WinNtSerialIo.inf
  $(WORKSPACE)/Nt32Pkg/TimerDxe/Timer.inf
  $(WORKSPACE)/Nt32Pkg/ResetRuntimeDxe/Reset.inf
  $(WORKSPACE)/Nt32Pkg/RealTimeClockRuntimeDxe/RealTimeClock.inf
  $(WORKSPACE)/Nt32Pkg/MetronomeDxe/Metronome.inf
  $(WORKSPACE)/Nt32Pkg/CpuRuntimeDxe/Cpu.inf
  $(WORKSPACE)/Nt32Pkg/FvbServicesRuntimeDxe/Nt32Fwh.inf
  $(WORKSPACE)/Nt32Pkg/PlatformBdsDxe/PlatformBds.inf
  $(WORKSPACE)/MdeModulePkg/Application/HelloWorld/HelloWorld.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Disk/DiskIo/Dxe/DiskIo.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Disk/Partition/Dxe/Partition.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Disk/UnicodeCollation/English/Dxe/English.inf
  $(WORKSPACE)/MdeModulePkg/Universal/SecurityStubDxe/SecurityStub.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Capsule/RuntimeDxe/CapsuleRuntime.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Ebc/Dxe/Ebc.inf
  $(WORKSPACE)/MdeModulePkg/Universal/GenericMemoryTest/Dxe/NullMemoryTest.inf
  $(WORKSPACE)/MdeModulePkg/Universal/FirmwareVolume/FaultTolerantWriteLite/Dxe/FtwLite.inf
  $(WORKSPACE)/MdeModulePkg/Universal/BaseMemoryTestPei/BaseMemoryTest.inf
  $(WORKSPACE)/MdeModulePkg/Universal/FirmwareVolume/GuidedSectionExtraction/Crc32SectionExtract/Dxe/Crc32SectionExtract.inf
  $(WORKSPACE)/MdeModulePkg/Universal/VariableRuntimeDxe/Variable.inf
  $(WORKSPACE)/MdeModulePkg/Universal/RuntimeDxe/Runtime.inf
  $(WORKSPACE)/MdeModulePkg/Bus/Pci/AtapiPassThruDxe/AtapiPassThru.inf
  $(WORKSPACE)/MdeModulePkg/Universal/WatchDogTimerDxe/WatchDogTimer.inf
  $(WORKSPACE)/MdeModulePkg/Universal/VariablePei/Variable.inf
  $(WORKSPACE)/MdeModulePkg/Universal/VariableRuntimeDxe/Variable.inf
  $(WORKSPACE)/MdeModulePkg/Bus/Scsi/ScsiBusDxe/ScsiBus.inf
  $(WORKSPACE)/MdeModulePkg/Bus/Scsi/ScsiDiskDxe/ScsiDisk.inf
#  $(WORKSPACE)/MdeModulePkg/Universal/PCD/Dxe/Pcd.inf
#  $(WORKSPACE)/MdeModulePkg/Universal/PCD/Pei/Pcd.inf
#  $(WORKSPACE)/IntelFrameworkModulePkg/Bus/Pci/PciBus/Dxe/PciBus.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Bus/Pci/IdeBus/Dxe/IdeBus.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/DataHub/DataHub/Dxe/DataHub.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/DataHub/DataHubStdErr/Dxe/DataHubStdErr.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/StatusCode/Dxe/DxeStatusCode.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/StatusCode/Pei/PeiStatusCode.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/HiiDataBaseDxe/HiiDatabase.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/SetupBrowserDxe/SetupBrowser.inf
  $(WORKSPACE)/IntelFrameworkModulePkg/Universal/DriverSampleDxe/DriverSample.inf
  $(WORKSPACE)/MdeModulePkg/Bus/Scsi/ScsiBusDxe/ScsiBus.inf     ##This driver follows UEFI specification definition
  $(WORKSPACE)/MdeModulePkg/Bus/Scsi/ScsiDiskDxe/ScsiDisk.inf    ##This driver follows UEFI specification definition
  $(WORKSPACE)/Nt32Pkg/Sec/SecMain.inf
  $(WORKSPACE)/MdeModulePkg/Core/Pei/PeiMain.inf
  $(WORKSPACE)/MdeModulePkg/Core/Dxe/DxeMain.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatform.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.inf
  $(WORKSPACE)/MdeModulePkg/Universal/DevicePathDxe/DevicePath.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Console/TerminalDxe/Terminal.inf
  $(WORKSPACE)/MdeModulePkg/Core/DxeIplPeim/DxeIpl.inf
  $(WORKSPACE)/MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsole.inf  
  $(WORKSPACE)/Nt32Pkg/WinNtFlashMapPei/FlashMap.inf
  $(WORKSPACE)/Nt32Pkg/WinNtFirmwareVolumePei/WinNtFwh.inf