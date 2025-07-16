FROM python:3.11-slim

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Create working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your notebook
COPY Data\ Analysis.ipynb .

# Expose Jupyter's default port
EXPOSE 8888

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
