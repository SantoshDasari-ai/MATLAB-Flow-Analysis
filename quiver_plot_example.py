import numpy as np
import matplotlib.pyplot as plt

# Define the grid of points
x = np.arange(-2, 2.2, 0.2)
y = np.arange(-2, 2.2, 0.2)

# Create meshgrid for coordinates
X, Y = np.meshgrid(x, y)

# Define the vector field components
U = -Y  # Negative Y component for U
V = X   # X component for V

# Create the quiver plot
plt.figure()
plt.quiver(X, Y, U, V)

# Add labels and title
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Quiver Plot Example')

# Adjust axis for better visualization
plt.axis('equal')
plt.show()
