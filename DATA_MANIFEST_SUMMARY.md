# Data Manifest Summary - Quick Reference

**Last Updated**: 2026-01-26
**Full Catalog**: See `EXTERNAL_DATA_CATALOG.md` for complete details

---

## TL;DR - Data Locations

| Data Type | Size | Location | Status |
|-----------|------|----------|--------|
| **Primary Pfn1 Data** | 100 MB | `data/` | ✅ Local |
| **LINCS Drug Data** | 33.5 GB | Google Drive | ☁️ Cloud |
| **MALDI Raw** | 51 GB | External storage | 🗄️ Archived |
| **Spatial RNA** | 8 GB | External storage | 🗄️ Archived |
| **Human snRNA** | 1.9 GB | External storage | 🗄️ Archived |
| **Phase 14 GWAS** | ~32 GB | Pending | ⏳ To download |

**Total**: 126.5 GB when Phase 14 complete

---

## Essential Local Data (~100 MB)

```
/Users/renatosocodato/PFn1 5xFAD/
├── data/
│   ├── plaque_data_merged.xlsx          # PRIMARY DATA - 313 plaques
│   ├── LMM_ULTRA_best_results.xlsx      # Statistical results
│   └── Mouse metadata files
│
└── spatial_integration/
    ├── data/processed/
    │   └── integrated_pfn1_maldi.rds    # Phase 1 K-NN matched data
    │
    └── phase*/output/                    # All phase results
```

**Backup Priority**: HIGHEST - This is irreplaceable research data

---

## Cloud/Archived Data (95 GB)

### Google Drive (33.5 GB)
```
~/Google Drive/My Drive/LINCS_CMap_2020_Beta/
├── compoundinfo_beta.txt       (4.4 MB)
├── geneinfo_beta.txt           (1.1 MB)
├── siginfo_beta.txt            (444 MB)
├── level5_*.gctx               (33 GB)
├── lincs_data_manifest.txt
└── LINCS_DATA_PROVENANCE.json
```

**Purpose**: Phase 13 drug repurposing
**Uploaded**: 2026-01-26
**Provenance**: `spatial_integration/phase13/data/LINCS_DATA_PROVENANCE.json`

### External Storage (61 GB - Archived)

**MALDI-MSI Raw Data** (51 GB):
- Location: External backup
- Source: Trinklein et al. 2025 Nature Comm
- Re-download: Illinois Data Bank IDB-4907703
- Used in: Phases 1-6

**Spatial Transcriptomics** (8 GB):
- Location: External backup
- Source: GEO GSE233208 (Mallach et al. 2023)
- Re-download: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208
- Used in: Phase 7 (paradigm shift discovery)

**Human snRNA-seq** (1.9 GB):
- Location: External backup
- Source: GEO GSE227223 (ROSMAP), GSE157827, GSE140511, GSE148822
- Re-download: GEO supplementary files
- Used in: Phases 8-9 (human validation)

**Restoration**: See `EXTERNAL_DATA_CATALOG.md` section 2-3 for commands

---

## Pending Downloads (Phase 14)

### Bellenguez 2022 AD GWAS (~32 GB)
```bash
# Requires EGA/NIAGADS access approval (1-3 days)
# Source: EGAS00001006255
# Alternative: NIAGADS ng00075
# See: spatial_integration/phase14/docs/DATA_ACQUISITION_GUIDE.md
```

### GTEx v8 Brain eQTL (~5 GB)
```bash
# Publicly available
# Download: https://gtexportal.org/
# Tissues: Hippocampus, Frontal Cortex, Anterior Cingulate
```

**Status**: Awaiting Phase 14 execution
**Timeline**: Download after data access approval

---

## External Databases (API Access Only)

No local storage - queried via APIs:

### Drug Databases (Phase 13)
- **DGIdb**: Drug-gene interactions
- **ChEMBL**: Bioactivity (IC50, Ki)
- **PubChem**: Molecular properties (BBB prediction)
- **DrugBank**: FDA approval status
- **STRING**: Protein interaction networks
- **Open Targets**: Target validation

### Genetic Databases (Phase 14)
- **GWAS Catalog**: AD risk variants
- **Open Targets Genetics**: Variant-gene mapping
- **MR-Base**: Mendelian randomization

### Reference Databases
- **Ensembl BioMart**: Gene annotations, orthologs
- **DoRothEA**: TF regulons
- **PROGENy**: Pathway scoring

**Provenance**: All API queries tracked in `spatial_integration/phase*/provenance/*.json`

---

## Data by Phase

| Phase | External Data | Size | Status |
|-------|---------------|------|--------|
| 1-6 | MALDI-MSI | 51 GB | Archived |
| 7 | GSE233208 Spatial | 8 GB | Archived |
| 8-9 | Human snRNA-seq (4 datasets) | 1.9 GB | Archived |
| 10-12 | Reference DBs (API) | 0 GB | Online |
| 13 | LINCS L1000 | 33.5 GB | Google Drive |
| 13 | Drug DBs (API) | 0 GB | Online |
| 14 | Bellenguez GWAS | ~32 GB | Pending |
| 14 | GTEx eQTL | ~5 GB | Pending |

---

## Required Citations

When using this project's data or methods, cite:

### Primary External Datasets

1. **MALDI Lipidomics**:
   Trinklein et al. (2025) Nature Communications. DOI: 10.1038/s41467-025-65956-w

2. **5xFAD Spatial**:
   Mallach et al. (2023) Immunity. PMID: 37660762

3. **ROSMAP snRNA**:
   Sun & Victor et al. (2023) Cell. PMID: 36549294

4. **LINCS L1000**:
   Subramanian et al. (2017) Cell. PMID: 29195078

5. **Bellenguez GWAS** (Phase 14):
   Bellenguez et al. (2022) Nature Genetics. DOI: 10.1038/s41588-022-01024-z

Full citation list in `EXTERNAL_DATA_CATALOG.md`

---

## Data Governance

### Publicly Shareable
- All code and analysis scripts
- Phase output summaries (CSV results)
- Figures and visualizations
- Provenance records (JSON)

### Restricted (Not in Repository)
- Raw Pfn1 cKO microscopy images (internal)
- MALDI-MSI raw files (51 GB - contact authors)
- LINCS GCTX file (33 GB - download from CLUE.io)
- Bellenguez GWAS (requires EGA approval)

### Already Public (Re-downloadable)
- GEO datasets (GSE233208, GSE227223, etc.)
- Drug/genetic databases (via APIs)

See: `spatial_integration/DATA_GOVERNANCE.md` for full policy

---

## Disk Space Management

### Current Usage
```
/Users/renatosocodato/PFn1 5xFAD/
├── Essential data: ~100 MB (local)
├── Phase outputs: ~500 MB (local)
├── Archived data: 61 GB (external storage)
├── Cloud data: 33.5 GB (Google Drive)
└── Pending: ~37 GB (Phase 14, to download)
```

### Recommendations
- **Keep locally**: Essential data (~100 MB) + outputs (~500 MB) = ~600 MB
- **External backup**: MALDI + spatial + human RNA = 61 GB
- **Cloud storage**: LINCS data = 33.5 GB (already on Google Drive)
- **Phase 14**: Download to temporary location, process, then archive

**Total working space needed**: ~40 GB for Phase 14 (including processing)

---

## Quick Commands

### Verify Local Data
```bash
cd /Users/renatosocodato/PFn1\ 5xFAD/
ls -lh data/plaque_data_merged.xlsx        # Should exist
ls -lh spatial_integration/data/processed/ # Should have integrated_pfn1_maldi.rds
```

### Check Google Drive LINCS Data
```bash
ls -lh ~/Google\ Drive/My\ Drive/LINCS_CMap_2020_Beta/
# Should show 6 files totaling ~33.5 GB
```

### Check Phase Outputs
```bash
find spatial_integration/phase*/output/ -name "*.csv" | wc -l
# Should show 100+ output files
```

### Verify Provenance Records
```bash
find spatial_integration/phase*/provenance/ -name "*.json" | wc -l
# Should show 30+ provenance files
```

---

## Restoration Procedures

### If MALDI Raw Data Needed
```bash
# Download from Illinois Data Bank
# URL: https://databank.illinois.edu/datasets/IDB-4907703
# Access code: YcLsIAvOfyTnspQq209l4h9BK-o8QkBJ9SNkV3xo7OM
# Extract to: data/raw/MALDI_MSI/
# Rerun: spatial_integration/scripts/01_knn_matching.R
```

### If Spatial Data Needed
```bash
cd spatial_integration/phase7/data/external/spatial/
wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE233nnn/GSE233208/suppl/\
GSE233208_5XFAD_seurat_processed_annotated.rds.gz
gunzip *.gz
```

### If LINCS Data Needed Locally
```bash
# Copy from Google Drive to local
cp -r ~/Google\ Drive/My\ Drive/LINCS_CMap_2020_Beta/* \
      spatial_integration/phase13/data/
```

---

## Help & Documentation

- **Full catalog**: `EXTERNAL_DATA_CATALOG.md` (comprehensive, 800+ lines)
- **Archive manifest**: `spatial_integration/DATA_ARCHIVE_MANIFEST.md`
- **Phase 14 data guide**: `spatial_integration/phase14/docs/DATA_ACQUISITION_GUIDE.md`
- **Data governance**: `spatial_integration/DATA_GOVERNANCE.md`
- **Phase provenance**: `spatial_integration/phase*/provenance/*.json`

---

**Last verified**: 2026-01-26
**Next update**: After Phase 14 GWAS download
