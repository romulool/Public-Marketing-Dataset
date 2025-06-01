## 📄 `README.md`

# 📊 Public Marketing Dataset Dashboard

This project presents a complete data analytics workflow using the [Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). It demonstrates how to clean, structure, and explore marketing data using **SQL**, **SQLite**, and **Metabase**, focusing on actionable business insights.

---

## 🔍 Project Objectives

- Extract and clean real-world e-commerce data
- Load it into a relational database (SQLite)
- Build SQL queries to analyze marketing and sales KPIs
- Visualize insights through an interactive Metabase dashboard
- Showcase technical and business-oriented data storytelling

---

## 🗃️ Dataset

- **Source**: [Olist Brazilian E-Commerce Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Contents**: Orders, customers, products, payments, reviews, and more
- **Size**: ~100 MB across multiple CSV files

This dataset is not included in the repository due to size. Follow the instructions below to download and load it.

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/romulool/Public-Marketing-Dataset.git
cd Public-Marketing-Dataset
```

---

### 2. Install Python Dependencies

Create and activate a virtual environment (recommended), then:

```bash
pip install -r requirements.txt
```

---

### 3. Download the Dataset with `kagglehub`

Open a Jupyter Notebook and run:

```python
from kagglehub.datasets import olistbr__brazilian_ecommerce

dataset_path = olistbr__brazilian_ecommerce.load(download_mode="force")
```

This will download and extract the dataset to your local environment.

---

### 4. Load the Data into SQLite

Open and run the notebook:

```bash
notebooks/01_load_to_sqlite.ipynb
```

This script reads the CSV files and creates a local SQLite database at:

```
data/sqlite/olist.db
```

> ⚠️ This file is excluded from version control using `.gitignore`.

---

## 📦 Running Metabase (Dashboard Tool)

This project uses Metabase (via Docker) for dashboarding.

### 1. Start Metabase with Docker Compose

Make sure [Docker Desktop](https://www.docker.com/products/docker-desktop/) is running.

Then execute:

```bash
docker-compose up -d
```

### 2. Access Metabase

Visit [http://localhost:3000](http://localhost:3000) in your browser.

Set up an admin user, then connect the SQLite database:

* **Database type**: SQLite
* **Database file path**: `/metabase-data/olist.db`

> The folder `data/sqlite` is mounted into the container at `/metabase-data`.

---

## 📈 Dashboard Overview

The dashboard explores:

* 📦 Order volume and growth trends
* 💰 Revenue by product category
* 🛒 Top-selling products
* 🌍 Regional customer insights

Screenshots and descriptions will be saved in `/dashboard/`.

---

## 📁 Project Structure

```
.
├── data/                  # Local data (ignored by Git)
│   └── sqlite/            # SQLite DB file
├── notebooks/             # Jupyter notebooks
├── sql/                   # SQL scripts
├── dashboard/             # Metabase screenshots, notes
├── docker-compose.yml     # Metabase container setup
├── requirements.txt       # Python package list
└── README.md              # This file
```

---

## 🔧 Tech Stack

* Python (Pandas, kagglehub)
* SQLite
* Metabase (Docker)
* SQL
* Jupyter Notebooks

---

## 🙋‍♂️ Author

**Romulo Leite**
Statistician & Data Scientist
📫 [GitHub](https://github.com/romulool)

---

## 📜 License

This project is open-source and licensed under the **MIT License**.
