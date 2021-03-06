#!/bin/bash
#where UHH2 code installed
pathGL_code=/nfs/dust/cms/user/deleokse/RunII_102X_v2/CMSSW_10_2_17/src/UHH2/
#where (NOT MERGED) trees after preselection stored
path_data=/nfs/dust/cms/group/zprime-uhh/Presel_2016/workdir_Zprime_PreSelec_2016/uhh2.AnalysisModuleRunner.

mkdir $pathGL_code/ZprimeSemiLeptonic/data/Skimming_datasets_2016v3
cd $pathGL_code/ZprimeSemiLeptonic/data/Skimming_datasets_2016v3


 #MC
for sample_name in QCD_HT50to100_2016v3 QCD_HT100to200_2016v3 QCD_HT200to300_2016v3 QCD_HT300to500_2016v3 QCD_HT500to700_2016v3 QCD_HT700to1000_2016v3 QCD_HT1000to1500_2016v3 QCD_HT1500to2000_2016v3 QCD_HT2000toInf_2016v3 DYJetsToLL_M-50_HT-70to100_2016v3  DYJetsToLL_M-50_HT-100to200_2016v3 DYJetsToLL_M-50_HT-200to400_2016v3 DYJetsToLL_M-50_HT-400to600_2016v3 DYJetsToLL_M-50_HT-600to800_2016v3 DYJetsToLL_M-50_HT-800to1200_2016v3 DYJetsToLL_M-50_HT-1200to2500_2016v3 DYJetsToLL_M-50_HT-2500toInf_2016v3 TT_TuneCUETP8M2T4_2016v3 WJetsToLNu_HT-70To100_2016v3 WJetsToLNu_HT-100To200_2016v3 WJetsToLNu_HT-200To400_2016v3 WJetsToLNu_HT-400To600_2016v3 WJetsToLNu_HT-600To800_2016v3 WJetsToLNu_HT-800To1200_2016v3 WJetsToLNu_HT-1200To2500_2016v3 WJetsToLNu_HT-2500ToInf_2016v3 ST_tW_antitop_5f_inclusiveDecays_2016v3  ST_tW_top_5f_inclusiveDecays_2016v3 ST_t-channel_antitop_2016v3 ST_t-channel_top_2016v3 ST_s-channel_2016v3 WW_2016v3 WZ_2016v3 ZZ_2016v3 ZprimeToTT_M1000_W100_2016v3 ZprimeToTT_M3000_W300_2016v3 ZprimeToTTJet_M1000_2016v3

do
    echo $sample_name

       $pathGL_code/scripts/create-dataset-xmlfile ${path_data}"MC."${sample_name}"*.root" MC_$sample_name.xml
       python $pathGL_code/scripts/crab/readaMCatNloEntries.py 10 MC_$sample_name.xml True
done

# # #DATA
for sample_name in DATA_SingleMuon_Run2016v3B DATA_SingleMuon_Run2016v3C DATA_SingleMuon_Run2016v3D DATA_SingleMuon_Run2016v3E DATA_SingleMuon_Run2016v3F DATA_SingleMuon_Run2016v3G DATA_SingleMuon_Run2016v3H DATA_SingleElectron_Run2016v3B DATA_SingleElectron_Run2016v3C DATA_SingleElectron_Run2016v3D DATA_SingleElectron_Run2016v3E DATA_SingleElectron_Run2016v3F DATA_SingleElectron_Run2016v3G DATA_SingleElectron_Run2016v3H

do
    echo $sample_name 
    $pathGL_code/scripts/create-dataset-xmlfile ${path_data}"DATA."${sample_name}"*.root" DATA_$sample_name.xml
    python $pathGL_code/scripts/crab/readaMCatNloEntries.py 10 DATA_$sample_name.xml True

done
pwd
cd $pathGL_code/ZprimeSemiLeptonic/macros
