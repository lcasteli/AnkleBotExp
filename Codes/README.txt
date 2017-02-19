1. Run ankleYawExperiments\data\SubjectName\ankleBotImpedance\myRenamingScript to rename Impedance files
2. ankleYawExperiments\Code\Impedance_reader(SubjectName)
3. ankleYawExperiments\Code\Imp_estimator(SubjectName)
4. ankleYawExperiments\Code\EMG_reader(SubjectName)
5. ankleYawExperiments\Code\Input_output_matrices_for_ANN(SubjectName)
6. Run the matlab ANN
7. ankleYawExperiments\Code\Shaded_plots_EI(SubjectName)

Note:
1. After running ANN in step 7, save all the results from ANN in the following way:
2. Save the results of ANN to workspace as:
    SubjectName_ei (for EI direction)
3. In folder ankleYawExperiments\Code\ANN models, Create a folder with name as the SubjectName
4. Save the workspace in this folder as SubjectName.mat

Optional:
1. ankleYawExperiments\Code\ANN models\plotANN(SubjectName)
2. ankleYawExperiments\Code\ANN models\Regressionplots(SubjectName)
    This returns a vector of all the Regression values
3. ankleYawExperiments\Code\ANN models\plot_input_output(SubjectName)
