%% Energy Generating Cycles
%% 10/12/18 Víctor A. López-Agudelo University of Antioquia.
clc; clear all

% Metabolic model names
METABOLIC_MODEL = {'iCG760'; 'iSM810';...
                   'sMtb'; 'GSMN_TB_1.1'; 'iOSDD890';...
                    'iNJ661v_modified'; 'iEK1011'; 'sMtb2018'};

% Energy Disipation Reaction Names
EGR = {'ATP_d'; 'GTP_d'; 'CTP_d'; 'UTP_d'}; % Energy Disipation Reaction Names

EGR_flux = zeros(length(METABOLIC_MODEL), length(EGR));

solverOK = changeCobraSolver('glpk','LP');

%% Maximization of energy disipation reaction flux

for k = 1: length(METABOLIC_MODEL)
    
    model = load_model(METABOLIC_MODEL{k});
    
    for i = 1:length(EGR)

    EGC_model = changeObjective(model,EGR{i},1); % Changing OBfun for each EGreaction
    sol = optimizeCbModel(EGC_model,'max'); % Solving FBA
    EGR_flux(k,i) = sol.f; % Saving Value of Objfun

    end
    
end 


