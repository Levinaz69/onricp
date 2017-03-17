# onricp - Optimal Non-rigid ICP

Modified from:

<https://github.com/charlienash/nricp>


onricp is a MATLAB implementation of a non-rigid variant of the iterative closest point algorithm. It can be used to register 3D surfaces or point-clouds. The method is described in the following paper:

> 'Optimal Step Nonrigid ICP Algorithms for Surface Registration', Amberg, Romandhani and Vetter, CVPR, 2007.

Features:

* Non-rigid and local deformations of a template surface or point cloud.
* Iterative stiffness reduction allows for global intitial transformations that become increasingly localised.  
* Optional initial rigid registration using standard iterative closest point.
* Optional bi-directional distance metric which encourages surface deformations to cover more of the target surface
* Handles missing data in the target surface by ignoring correspondences with points on target edges.

## Dependencies

Requires:

* geom3d - <http://uk.mathworks.com/matlabcentral/fileexchange/24484-geom3d>
* Toolbox Graph - <http://uk.mathworks.com/matlabcentral/fileexchange/5355-toolbox-graph>
* Iterative Closest Point - <http://uk.mathworks.com/matlabcentral/fileexchange/27804-iterative-closest-point>

