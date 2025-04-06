##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ucosRdev
ConfigurationName      :=Debug
WorkspaceConfiguration :=Debug
WorkspacePath          :=/Users/sergey/projloc/ucosRdev
ProjectPath            :=/Users/sergey/projloc/ucosRdev
IntermediateDirectory  :=$(ConfigurationName)
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=sergey
Date                   :=05/04/2025
CodeLitePath           :=/Users/sergey/.codelite
LinkerName             :=/Applications/arm/bin/arm-none-eabi-gcc
SharedObjectLinkerName :=/Applications/arm/bin/arm-none-eabi-g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputDirectory        :=$(IntermediateDirectory)
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=$(PreprocessorSwitch)__SAMD51J20A__ 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="ucosRdev.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            := -TucosR_1M_256k.ld -mthumb --specs=nosys.specs -Wl,--gc-sections -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch)inc $(IncludeSwitch)inc/cmsis $(IncludeSwitch)inc/samd51 $(IncludeSwitch)inc/kernel $(IncludeSwitch)user/ 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)m $(LibrarySwitch)ucosR 
ArLibs                 :=  "m" "ucosR" 
LibPath                := $(LibraryPathSwitch)lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overridden using an environment variable
##
AR       := /Applications/arm/bin/arm-none-eabi-ar rcu
CXX      := /Applications/arm/bin/arm-none-eabi-g++
CC       := /Applications/arm/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   := -mthumb -ffunction-sections -fdata-sections -mcpu=cortex-m4 -std=gnu99 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /Applications/arm/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
shell:=zsh
Objects0=$(IntermediateDirectory)/user_iface_demo.c$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/src_main.c$(ObjectSuffix) $(IntermediateDirectory)/src_syscalls.c$(ObjectSuffix) $(IntermediateDirectory)/src_startup.c$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo $(Objects1) >> $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	/Applications/ARM/bin/arm-none-eabi-size Debug/ucosRdev
	/Applications/ARM/bin/arm-none-eabi-objcopy -O ihex Debug/ucosRdev Debug/ucosRdev.hex
	@echo Done

MakeIntermediateDirs:
	@test -d $(ConfigurationName) || $(MakeDirCommand) $(ConfigurationName)


$(IntermediateDirectory)/.d:
	@test -d $(ConfigurationName) || $(MakeDirCommand) $(ConfigurationName)

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/user_iface_demo.c$(ObjectSuffix): user/iface_demo.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/user_iface_demo.c$(ObjectSuffix) -MF$(IntermediateDirectory)/user_iface_demo.c$(DependSuffix) -MM user/iface_demo.c
	$(CC) $(SourceSwitch) "/Users/sergey/projloc/ucosRdev/user/iface_demo.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/user_iface_demo.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/user_iface_demo.c$(PreprocessSuffix): user/iface_demo.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/user_iface_demo.c$(PreprocessSuffix) user/iface_demo.c

$(IntermediateDirectory)/src_main.c$(ObjectSuffix): src/main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main.c$(DependSuffix) -MM src/main.c
	$(CC) $(SourceSwitch) "/Users/sergey/projloc/ucosRdev/src/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_main.c$(PreprocessSuffix): src/main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_main.c$(PreprocessSuffix) src/main.c

$(IntermediateDirectory)/src_syscalls.c$(ObjectSuffix): src/syscalls.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_syscalls.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_syscalls.c$(DependSuffix) -MM src/syscalls.c
	$(CC) $(SourceSwitch) "/Users/sergey/projloc/ucosRdev/src/syscalls.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_syscalls.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_syscalls.c$(PreprocessSuffix): src/syscalls.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_syscalls.c$(PreprocessSuffix) src/syscalls.c

$(IntermediateDirectory)/src_startup.c$(ObjectSuffix): src/startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_startup.c$(DependSuffix) -MM src/startup.c
	$(CC) $(SourceSwitch) "/Users/sergey/projloc/ucosRdev/src/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_startup.c$(PreprocessSuffix): src/startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_startup.c$(PreprocessSuffix) src/startup.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r $(ConfigurationName)/


