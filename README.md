# checkEGCsGEM (checking the Existence of Energy Generating Cycles in GEnome-scale Models)

Energy generating cycles (EGCs) exist in metabolic networks and can charge energy metabolites like ATP, GTP, CDP, and UTP without any input of nutrients; therefore, their elimination is essential for correcting energy metabolism (Fritzemeier et al., 2017; Orth et al., 2011). Fritzemeier and colleagues developed an optimization methodology for identifying if genome-scale models contain EGCs. This matlab implementation applies the optimization method of these researchers with Genome-Scale Models of *Mycobacterium tuberculosis* in two steps: 1) Addition of Energy dissipation reactions (EDR) for ATP, GTP, CTP and UTP in the form: H2O[c] + XTP[c] -> H[c] + XDP[c] + Pi[c] and 2) maximization of each EDR flux while no substrate uptake is allowed into the model. Further information of this optimization methodology in:

* López-Agudelo, V. A., Mendum, T. A., Laing, E., Wu, H., Baena, A., Barrera, L. F., ... & Rios-Estepa, R. (2020). A systematic evaluation of Mycobacterium tuberculosis Genome-Scale Metabolic Networks. PLoS computational biology, 16(6), e1007533.(https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1007533)
* Fritzemeier, C. J., Hartleb, D., Szappanos, B., Papp, B., & Lercher, M. J. (2017). Erroneous energy-generating cycles in published genome scale metabolic networks: Identification and removal. PLoS computational biology, 13(4), e1005494.(https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005494)

## Dependencies

* Cobra Toolbox 3.0
* Gurobi
* Matlab 2018a

