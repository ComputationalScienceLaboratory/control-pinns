# [Control Physics Informed Neural Networks](https://arxiv.org/)
Control Physics-Informed Neural Networks (PINNs) can simultaneously solve the learning tasks of the system state of a PDE, and its respective optimal control, in a one-stage framework while conforming to physical laws of the given system. Prior two-stage approaches applying PINNs to control problems are presented, while background information on scientific ML, PINNs, and their relationship with reinforcement learning is brought to light. The robustness of Control PINNs is demonstrated through increasingly complex open-loop control problems pertaining to:
1. [An analytical problem](https://github.com/ComputationalScienceLaboratory/control-pinn/blob/main/notebooks/ControlPINN_Analytical_Problem.ipynb)
2. [A heat equation](https://github.com/ComputationalScienceLaboratory/control-pinn/blob/main/notebooks/ControlPINN_HeatEquation_1D.ipynb)
3. [A predator prey problem](https://github.com/ComputationalScienceLaboratory/control-pinn/blob/main/notebooks/ControlPINN_Predator_Prey_2D.ipynb)

![Predator-Prey problem](https://github.com/ComputationalScienceLaboratory/control-pinns/blob/main/animations/ControlPINN_Predator_Prey_Absolute_Error.gif "Evolution of the absolute error between the solution and numerical simulation")

![Analytical problem](https://github.com/ComputationalScienceLaboratory/control-pinns/blob/main/animations/AnalyticalProblem_Convergence.gif "Evolution of the solution and optimal control")

# Citation
```
@article{barrystraume2022controlpinns,
  title={Physics-informed neural networks for PDE-constrained optimization and control},
  author={Barry-Straume, Jostein and Sarshar, Arash and Popov, Andrey A. and Sandu, Adrian},
  journal={arXiv preprint},
  year={2024}
}
```
