function model = load_model(metabolic_model)
% Load a genome scale model for the selected organism.
% Options:
% metabolic_model: 'iCG760', ' sMtb2.0
%                  'iSM810', 'sMtb',
%                  'GSMN_TB_1.1', 'iNJ661v_modified', 'iOSDD890'
%
% Author: Victor Lopez, Septiembre 21, 2017.


%% MODEL PATH

    VASHISHT_MODEL = 'models/iOSDD890_EGC.mat';
    GARAY_MODEL = 'models/iCG760_EGC.mat'; 
    MA_MODEL = 'models/iSM810_EGC.mat';
    LOFTHOUSE_MODEL = 'models/GSMN_TB1.1_EGC.mat';
    RIENKSMA_MODEL = 'models/sMtb1_0_EGC.mat';
    XAVIER_MODEL = 'models/iNJ661v_mod_EGC.mat';
    RIENKSMA_2018 = 'models/sMtb2018_EGC.mat';
    KAVVAS_MODEL = 'models/iEK1011_EGC.mat';
    
%% MEDIUM PATH

    MA_MEDIUM = 'medium/ExchangeRxns_MA2015.mat';
    LOFTHOUSE_MEDIUM = 'medium/ExchangeRxns_MA2015.mat';   

%% CHOICES    
    
switch metabolic_model
    
                                
            case 'iCG760'
                    
                    load(GARAY_MODEL);
                    model = iCG760_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000;
                    exchangeRxns  = model.rxns(findExcRxns(model)); 
                    model = changeRxnBounds(model,exchangeRxns,0,'l'); % no substrate input
                    model = changeRxnBounds(model,'R129',0,'b'); % Mainteinence was fix to 0 mmol/gDW/h
%                     model = addReaction(model,'ATP_d','ATP[c] -> H[c] + ADP[c] + PI[c]');
%                     model = addReaction(model,'GTP_d','GTP[c] -> H[c] + GDP[c] + PI[c]');
%                     model = addReaction(model,'CTP_d','CTP[c] -> H[c] + CDP[c] + PI[c]');
% 					model = addReaction(model,'UTP_d','UTP[c] -> H[c] + UDP[c] + PI[c]');
    
            case 'iSM810'
                               
                    load (MA_MODEL);
                    model = iSM810_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000; 
                    load (MA_MEDIUM);
                    model = changeRxnBounds(model,ExchangeRxns,0,'u'); % no substrate input
                    model = changeRxnBounds(model,'R129',0,'b'); % Maintainance was fix to 0 mmol/gDWH
%                     model = addReaction(model,'ATP_d','ATP[c] -> H[c] + ADP[c] + PI[c]');
%                     model = addReaction(model,'GTP_d','GTP[c] -> H[c] + GDP[c] + PI[c]');
%                     model = addReaction(model,'CTP_d','CTP[c] -> H[c] + CDP[c] + PI[c]');
% 					model = addReaction(model,'UTP_d','UTP[c] -> H[c] + UDP[c] + PI[c]');
                    
                   
              case 'sMtb'
            
                    load(RIENKSMA_MODEL);
                    model = sMtb1_0_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000;
                    exchangeRxns  = model.rxns(findExcRxns(model)); 
                    model = changeRxnBounds(model,exchangeRxns,0,'l');  % no substrate input
                    model = changeRxnBounds(model,'Maintenance',0,'b'); % Maintenance reaction was fix to 0 mmol/gDW/h.
%                     model = addReaction(model,'ATP_d','H2O[c] + ATP[c] -> H[c] + ADP[c] + PI[c]');
%                     model = addReaction(model,'GTP_d','H2O[c] + GTP[c] -> H[c] + GDP[c] + PI[c]');
%                     model = addReaction(model,'CTP_d','H2O[c] + CTP[c] -> H[c] + CDP[c] + PI[c]');
% 					model = addReaction(model,'UTP_d','H2O[c] + UTP[c] -> H[c] + UDP[c] + PI[c]');
                     
              case 'GSMN_TB_1.1'
                    
                    load(LOFTHOUSE_MODEL);
                    load(LOFTHOUSE_MEDIUM);
                    model = GSMN_TB1_1_EGC;
                    model.ub(model.ub > 1) = 1000;
                    model = changeRxnBounds(model,ExchangeRxns,0,'u'); % no substrate input
                    model = changeRxnBounds(model,'R129',0,'b'); % maintaince reaction was fix to 0 mmol/gDW/h
%                     model = addReaction(model,'ATP_d','ATP[c] -> H[c] + ADP[c] + PI[c]');
%                     model = addReaction(model,'GTP_d','GTP[c] -> H[c] + GDP[c] + PI[c]');
%                     model = addReaction(model,'CTP_d','CTP[c] -> H[c] + CDP[c] + PI[c]');
% 					model = addReaction(model,'UTP_d','UTP[c] -> H[c] + UDP[c] + PI[c]');
                    
              case 'iOSDD890'
                    
                    load(VASHISHT_MODEL);
                    model = iOSDD890_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000;
                    exchangeRxns  = model.rxns(findExcRxns(model)); 
                    model = changeRxnBounds(model,exchangeRxns,0,'l'); % No substrate input
                    model = changeRxnBounds(model,'ATPS1',0,'b'); % maintaince reaction was fix to 0 mmol/gDW/h
% 					model = addReaction(model,'ATP_d','h2o[c] + atp[c] -> h[c] + adp[c] + pi[c]');
%                     model = addReaction(model,'GTP_d','h2o[c] + gtp[c] -> h[c] + gdp[c] + pi[c]');
%                     model = addReaction(model,'CTP_d','h2o[c] + ctp[c] -> h[c] + cdp[c] + pi[c]');
% 		            model = addReaction(model,'UTP_d','h2o[c] + utp[c] -> h[c] + udp[c] + pi[c]');
                                 
               case 'iNJ661v_modified'
            
                    load(XAVIER_MODEL);
                    model = iNJ661v_mod_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000;
                    exchangeRxns  = model.rxns(findExcRxns(model)); 
                    model = changeRxnBounds(model,exchangeRxns,0,'l'); % no substrate iput
                    model = changeRxnBounds(model,'ATPS1',0,'b'); % maintaince reaction was fix to 1 mmol/gDW/h
%                     model = addReaction(model,'ATP_d','h2o[c] + atp[c] -> h[c] + adp[c] + pi[c]');
%                     model = addReaction(model,'GTP_d','h2o[c] + gtp[c] -> h[c] + gdp[c] + pi[c]');
%                     model = addReaction(model,'CTP_d','h2o[c] + ctp[c] -> h[c] + cdp[c] + pi[c]');
% 		            model = addReaction(model,'UTP_d','h2o[c] + utp[c] -> h[c] + udp[c] + pi[c]');
                case 'iEK1011'
                    
                    load(KAVVAS_MODEL);
                    model = iEK1011_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000;
                    exchangeRxns = model.rxns(findExcRxns(model));
                    model = changeRxnBounds(model,exchangeRxns,0,'l');
                    model = changeRxnBounds(model,'ATPM',0,'b'); % maintaince reaction was fix to 1 mmol/gDW/h
              
                case 'sMtb2018'
                    
                    load(RIENKSMA_2018);
                    model = sMtb2018_EGC;
                    model.lb(model.lb < 0) = -1000;
                    model.ub(model.ub > 1) = 1000;
                    exchangeRxns  = model.rxns(findExcRxns(model)); 
                    model = changeRxnBounds(model,exchangeRxns,0,'l'); 
                    model = changeRxnBounds(model,'R_Maintenance',0,'b'); % Maintenance reaction was fix to 1 mmol/gDW/h.
                    
                  
end
              
              
end