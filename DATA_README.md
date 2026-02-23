# Data Documentation - Quick Access

**Last Updated**: 2026-02-23

This file provides quick links to all data documentation in this repository.

---

## 📊 Complete Data Catalog

**[EXTERNAL_DATA_CATALOG.md](EXTERNAL_DATA_CATALOG.md)** (783 lines)
- Comprehensive catalog of ALL external data used in this project
- Covers Phases 1-14
- Includes sources, sizes, locations, citations
- Documents 126.5 GB total data footprint
- Provenance tracking for all datasets

**Contents**:
- Primary research data (Pfn1 cKO)
- MALDI-MSI lipidomics (51 GB)
- Spatial transcriptomics (8 GB)
- Human snRNA-seq datasets (1.9 GB)
- LINCS drug data (33.5 GB on Google Drive)
- Phase 14 GWAS data (pending, ~32 GB)
- All external databases and APIs
- Data retention policy
- Required citations

---

## 📋 Quick Reference

**[DATA_MANIFEST_SUMMARY.md](DATA_MANIFEST_SUMMARY.md)** (250 lines)
- TL;DR version of data locations
- Essential local data (~100 MB)
- Cloud/archived data (95 GB)
- Restoration procedures
- Quick commands for verification
- Phase-by-phase data usage

**Quick lookups**:
- Where is the LINCS data? → Google Drive
- Where is MALDI raw data? → External storage (51 GB, archived)
- What needs to download for Phase 14? → Bellenguez GWAS (~32 GB)
- What's kept locally? → ~600 MB (essential + outputs)

---

## 🗄️ Archived Data

**[spatial_integration/DATA_ARCHIVE_MANIFEST.md](spatial_integration/DATA_ARCHIVE_MANIFEST.md)**
- Details on 64 GB of archived data
- MALDI-MSI raw files (51 GB)
- Public datasets (GEO, 10 GB)
- Archival instructions
- Re-download commands

## 🧾 Purged Data Provenance (Run `reclaim_run_2026-02-22`)

**[PURGED_DATA_PROVENANCE_CONSOLIDATION.md](PURGED_DATA_PROVENANCE_CONSOLIDATION.md)**
- Consolidated provenance for every purged/archived path from the reclaim run.
- Includes source size, purge outcome, origin/accession-equivalent, origin URL and repository class.
- Lists destination paths in Google Drive for archived items.
- Includes explicit provenance class notes including non-represented repository domains (GitHub/Zenodo/Dryad/Figshare) for this run.

**[purged_data_provenance_registry.csv](reclaim_run_2026-02-22/purged_data_provenance_registry.csv)**
- Machine-readable provenance registry with one row per purged/archived path.
- Includes origin repository class (GEO/Allen S3/local), accession-equivalent IDs or notes, original reference URL, and Google Drive destination.

**[purged_data_provenance_in_depth.tsv](reclaim_run_2026-02-22/purged_data_provenance_in_depth.tsv)**
- In-depth normalized provenance audit table used for compliance checks (accession/equivalent, origin URL, repository class, archive destination).

**[purged_data_provenance_master_third_pass.tsv](reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv)**
- Third-pass consolidation join across registry, ledgers, and manifest records for all purged rows.

**[purged_data_provenance_audit_second_pass.md](reclaim_run_2026-02-22/purged_data_provenance_audit_second_pass.md)**
- Second-pass audit status for the entire consolidated purge run (all public references resolved; archive locations verified).

**[purged_data_provenance_audit_third_pass.md](reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.md)**
- Third-pass in-depth audit with strict check of accession/reference completeness, public-origin URL validation, and archive integrity.

**[purged_data_provenance_audit_third_pass.tsv](reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.tsv)**
- Machine-readable third-pass audit ledger (33 rows, PASS; public-domain and Google Drive checks).

---

## 📖 Additional Documentation

### Phase-Specific Data Docs

| Phase | Documentation |
|-------|---------------|
| Phase 1-6 | `spatial_integration/docs/DATA_SOURCES.md` |
| Phase 7 | GEO GSE233208 (8 GB spatial RNA) |
| Phase 8-9 | GEO GSE227223 + 3 others (1.9 GB human RNA) |
| Phase 13 | `phase13/data/LINCS_DATA_PROVENANCE.json` |
| Phase 14 | `phase14/docs/DATA_ACQUISITION_GUIDE.md` |

### Provenance Records

All API queries and data transformations tracked in:
```
spatial_integration/phase*/provenance/*.json
```

30+ JSON files documenting:
- Input data sources and versions
- Analysis parameters
- Results summaries
- Validation status
- Timestamps and versions

---

## 🔍 Finding Specific Data

### By Data Type

**Microscopy Data**:
- Primary Pfn1 cKO plaques: `data/plaque_data_merged.xlsx`
- MALDI-MSI raw: External storage (archived)
- Processed integrated: `spatial_integration/data/processed/`

**Genomics Data**:
- Pfn1 cKO RNA-seq: Internal (Phase 2.5)
- 5xFAD spatial: External storage (archived, GEO GSE233208)
- Human snRNA-seq: External storage (archived, 4 GEO datasets)
- LINCS L1000: Google Drive (33.5 GB)
- Bellenguez GWAS: Pending download (Phase 14)

**Drug/Target Data**:
- LINCS compounds: Google Drive
- DGIdb/ChEMBL/PubChem: API queries (no local storage)
- Drug target results: `spatial_integration/phase13/output/`

### By Phase

| Phase | Primary Data | Location |
|-------|--------------|----------|
| 1 | MALDI-MSI | External (51 GB) |
| 2-6 | Integrated data | `data/processed/` |
| 7 | GSE233208 | External (8 GB) |
| 8-9 | 4 GEO datasets | External (1.9 GB) |
| 10-12 | ROSMAP subset | External (602 MB) |
| 13 | LINCS + DBs | Google Drive + APIs |
| 14 | GWAS + eQTL | Pending download |

### By Size

1. **MALDI raw** (51 GB) - Archived externally
2. **LINCS L1000** (33.5 GB) - Google Drive
3. **Bellenguez GWAS** (~32 GB) - Pending
4. **GSE233208 spatial** (8 GB) - Archived externally
5. **GTEx eQTL** (~5 GB) - Pending
6. **Human snRNA-seq** (1.9 GB) - Archived externally
7. **Everything else** (<1 GB) - Local

---

## 💾 Storage Summary

### Current Storage (94.5 GB)

```
Local (working directory):
├── Essential data: 100 MB
├── Phase outputs: 500 MB
└── Total local: ~600 MB

External Storage (archived):
├── MALDI-MSI raw: 51 GB
├── Spatial RNA (GSE233208): 8 GB
├── Human snRNA (4 datasets): 1.9 GB
└── Total archived: 61 GB

Cloud Storage:
└── LINCS L1000 (Google Drive): 33.5 GB
```

### With Phase 14 (126.5 GB)

Add:
- Bellenguez GWAS: ~32 GB
- GTEx brain eQTL: ~5 GB

---

## 🔐 Data Access

### Publicly Available (No Restrictions)
- GEO datasets (GSE233208, GSE227223, etc.)
- Drug databases (DGIdb, ChEMBL, PubChem)
- GWAS Catalog, GTEx
- ✅ Can share and redistribute

### Requires Registration (Free Academic)
- Bellenguez GWAS (EGA or NIAGADS)
- DrugBank (academic license)
- LINCS full access
- ✅ Can use with citation

### Internal/Proprietary
- Pfn1 cKO plaque data
- MALDI-MSI raw files (contact authors)
- ⚠️ Contact for access

---

## 📝 Required Citations

When using data from this project:

### Must Cite (Primary Datasets)

1. **MALDI Lipidomics**: Trinklein et al. (2025) Nat Commun. DOI: 10.1038/s41467-025-65956-w
2. **5xFAD Spatial**: Mallach et al. (2023) Immunity. PMID: 37660762
3. **ROSMAP snRNA**: Sun & Victor et al. (2023) Cell. PMID: 36549294
4. **LINCS L1000**: Subramanian et al. (2017) Cell. PMID: 29195078
5. **Bellenguez GWAS**: Bellenguez et al. (2022) Nat Genet. DOI: 10.1038/s41588-022-01024-z

See `EXTERNAL_DATA_CATALOG.md` for complete citation list.

---

## 🆘 Troubleshooting

### Data Not Found

**Local data missing**:
```bash
# Verify essential files
ls -lh data/plaque_data_merged.xlsx
ls -lh spatial_integration/data/processed/integrated_pfn1_maldi.rds
```

**LINCS data not on Google Drive**:
- Check: `~/Google Drive/My Drive/LINCS_CMap_2020_Beta/`
- Re-download: https://clue.io/data/CMap2020#LINCS2020

**Archived data needed**:
- See restoration instructions in `EXTERNAL_DATA_CATALOG.md`
- GEO downloads: Use accession numbers (GSE233208, etc.)
- MALDI raw: Illinois Data Bank IDB-4907703

### Disk Space Issues

**Current usage too high**:
```bash
# Phase 14 download requires ~40 GB temporary space
# After processing, can delete raw GWAS files
# Keep only filtered versions (~2 GB)
```

**Recommended cleanup**:
- Archive Phase 7-9 raw data (10 GB) if analyses complete
- LINCS GCTX file (33 GB) already on Google Drive
- Delete intermediate processing files if regenerable

---

## 📞 Contact

**Data questions**:
- Internal Pfn1 data: renatosocodato
- MALDI data: See Trinklein et al. 2025 (Illinois Data Bank)
- GEO datasets: Use GEO accession numbers
- LINCS: https://clue.io/support
- GWAS: EGA/NIAGADS support

**Documentation issues**:
- Report in repository issues
- Check provenance JSON files first

---

## 📅 Changelog

**2026-01-26 - Complete Data Catalog**
- Created EXTERNAL_DATA_CATALOG.md (783 lines)
- Created DATA_MANIFEST_SUMMARY.md (quick reference)
- Documented all Phases 1-14
- Added LINCS Google Drive location
- Added Phase 14 pending downloads
- Cataloged all APIs and databases

**2026-01-24 - Archive Manifest**
- Created DATA_ARCHIVE_MANIFEST.md
- Documented 64 GB archived data

**2024-2025 - Phase Documentation**
- Created phase-specific provenance JSONs
- Added DATA_SOURCES.md
- Created PFN1_DATA_PROVENANCE.md

---

**For complete details, see [EXTERNAL_DATA_CATALOG.md](EXTERNAL_DATA_CATALOG.md)**
