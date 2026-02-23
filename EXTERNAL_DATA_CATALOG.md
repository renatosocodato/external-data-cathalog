# External Data Catalog (WO044-WO047)

Generated: 2026-01-26
Updated: 2026-02-05
Scope: Unified catalog of all external data used across WO044–WO047, with provenance,
local mirrors, usage in this repo, re-download commands, and disk‑reclaim guidance.

## Hash + trace
- File hashes: `outputs/analysis/wo047/external_data_hash_manifest.csv`
- Summary: `outputs/analysis/wo047/external_data_hash_manifest_summary.yml`
- Missing (referenced but not mirrored): `outputs/analysis/wo047/external_data_hash_missing.csv`
- Hashing script: `analysis/wo047/wo047_external_data_hash_manifest.py`

## Disk reclaim guidance
- Items moved to Trash are listed in `outputs/analysis/wo047/cleanup_manifest.yml`.
- Empty Trash to reclaim space; all removed items are re-downloadable via commands below.
- Keep derived outputs under `outputs/analysis/*` for reproducibility without recomputation.

---

## Google Drive Omics Mirror Uploads (2026-02-04)
- Base folder (Drive): `gdrive:thermocausality_mtce_omics_mirror_2026-02-04`
- Phase22 mirror: `gdrive:thermocausality_mtce_omics_mirror_2026-02-04/phase22_thermodynamic_cost_omics_mirror`
- Phase23 mirror: `gdrive:thermocausality_mtce_omics_mirror_2026-02-04/phase23_collective_intelligence_omics_mirror`
- Phase23 MIBI raw bundle: `gdrive:thermocausality_mtce_omics_mirror_2026-02-04/phase23_collective_intelligence_omics_mirror/mibi/raw/hippocampus_mibi_2026-02-04.tar`
- Phase24 mirror: `gdrive:thermocausality_mtce_omics_mirror_2026-02-04/phase24_thermo_invariants_omics_mirror`
- Phase30 mirror: `gdrive:thermocausality_mtce_omics_mirror_2026-02-04/phase30_external_validation_omics_mirror`
- Provenance log: `/Users/renatosocodato/thermocausality_mtce/provenance/OMICS_MIRROR_UPLOAD_LOG_2026-02-04.md`
- Upload manifest: `/Users/renatosocodato/thermocausality_mtce/provenance/omics_mirror_upload_manifest.csv`
- Cleanup log: `/Users/renatosocodato/thermocausality_mtce/provenance/omics_mirror_raw_cleanup_log_2026-02-05.md`
- Cleanup pass executed: raw mirror paths removed per cleanup plan.

## External data mirrors (with provenance + usage)

### Networks and pathway resources

1) STRING v11.5 (human 9606)
- Local mirror:
  - `data/raw/networks/string/v11.5/9606.protein.links.full.v11.5.txt.gz`
  - `data/raw/networks/string/v11.5/9606.protein.info.v11.5.txt.gz`
- Provenance: STRING DB v11.5 (human 9606 bulk links + protein info).
- Work orders: WO047
- Usage: CDC42 proximity enrichment for CRISPRi/CROP‑seq perturbation hits.
- Reclaim: delete `data/raw/networks/string/v11.5/`.
- Re-download:
  ```bash
  mkdir -p data/raw/networks/string/v11.5
  curl -L -o data/raw/networks/string/v11.5/9606.protein.links.full.v11.5.txt.gz \
    https://stringdb-static.org/download/protein.links.full.v11.5/9606.protein.links.full.v11.5.txt.gz
  curl -L -o data/raw/networks/string/v11.5/9606.protein.info.v11.5.txt.gz \
    https://stringdb-static.org/download/protein.info.v11.5/9606.protein.info.v11.5.txt.gz
  ```

2) BioGRID 4.4.236 (human)
- Local mirror:
  - `data/raw/networks/biogrid/BIOGRID-ALL-4.4.236.tab3.zip`
- Provenance: BioGRID release 4.4.236 (human interactions).
- Work orders: WO047
- Usage: Alternate interaction graph for CDC42 proximity enrichment.
- Reclaim: delete `data/raw/networks/biogrid/`.
- Re-download:
  ```bash
  mkdir -p data/raw/networks/biogrid
  curl -L -o data/raw/networks/biogrid/BIOGRID-ALL-4.4.236.tab3.zip \
    https://downloads.thebiogrid.org/Download/BioGRID/Release-Archive/BIOGRID-4.4.236/BIOGRID-ALL-4.4.236.tab3.zip
  ```

3) STRING v12.0 (mouse 10090)
- Local mirror:
  - `manuscript/orchestration/story_archaeology/external/datasets/string_v12/10090.protein.links.v12.0.txt.gz`
- Provenance: STRING DB v12.0 (mouse 10090 links).
- Work orders: WO044
- Usage: Network topology quantification + CDC42 module replication.
- Reclaim: delete the file.
- Re-download:
  ```bash
  mkdir -p manuscript/orchestration/story_archaeology/external/datasets/string_v12
  curl -L -o manuscript/orchestration/story_archaeology/external/datasets/string_v12/10090.protein.links.v12.0.txt.gz \
    https://stringdb-static.org/download/protein.links.v12.0/10090.protein.links.v12.0.txt.gz
  ```

### Human microglia perturbation datasets (GEO/SRA)

4) GSE178317 (Kampmann lab iTF‑microglia CROP‑seq)
- Local mirror:
  - `data/raw/human_microglia/perturbations/GSE178317/raw`
  - `data/raw/human_microglia/perturbations/GSE178317/sra`
  - `data/raw/human_microglia/perturbations/GSE178317/dropbox_mageck_inc`
  - `data/raw/human_microglia/perturbations/GSE178317/pmc_oa`
- Provenance: GEO GSE178317; SRA SRP324266 (SRR14828091‑94);
  Kampmann lab mageck‑inc Dropbox; PMC OA package (PMC9448678, MOESM4 ESM).
- Work orders: WO047
- Usage: sgRNA mapping, per‑sgRNA expression signatures, CDC42 module stats.
- Reclaim: delete `data/raw/human_microglia/perturbations/GSE178317/*`.
- Status: SRA downloads + RAW.tar moved to Trash after sgRNA mapping; re-download with commands below.
- Re-download:
  ```bash
  mkdir -p data/raw/human_microglia/perturbations/GSE178317/raw
  curl -L -o data/raw/human_microglia/perturbations/GSE178317/raw/GSE178317_RAW.tar \
    https://ftp.ncbi.nlm.nih.gov/geo/series/GSE178nnn/GSE178317/suppl/GSE178317_RAW.tar

  mkdir -p data/raw/human_microglia/perturbations/GSE178317/sra
  prefetch --output-directory data/raw/human_microglia/perturbations/GSE178317/sra \
    SRR14828091 SRR14828092 SRR14828093 SRR14828094
  ```

5) GSE163323 (iMGL CRISPRi)
- Local mirror:
  - `data/raw/human_microglia/perturbations/GSE163323/raw` (GSM6157296/7299/7302)
- Provenance: GEO GSE163323 (GSM6157296/7299/7302 supplements).
- Work orders: WO047
- Usage: CRISPRi sgRNA signatures + CDC42 module stats.
- Reclaim: delete `data/raw/human_microglia/perturbations/GSE163323/raw`.
- Re-download:
  ```bash
  mkdir -p data/raw/human_microglia/perturbations/GSE163323/raw
  aria2c -c -x 8 -s 8 -k 1M -d data/raw/human_microglia/perturbations/GSE163323/raw \
    https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM6157nnn/GSM6157296/suppl/GSM6157296_iMGL_CRISPRi_ci1_filtered_feature_bc_matrix.h5 \
    https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM6157nnn/GSM6157296/suppl/GSM6157296_iMGL_CRISPRi_ci1_protospacer_calls_per_cell.csv.gz \
    https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM6157nnn/GSM6157299/suppl/GSM6157299_iMGL_CRISPRi_ci2_filtered_feature_bc_matrix.h5 \
    https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM6157nnn/GSM6157299/suppl/GSM6157299_iMGL_CRISPRi_ci2_protospacer_calls_per_cell.csv.gz \
    https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM6157nnn/GSM6157302/suppl/GSM6157302_iMGL_CRISPRi_ci3_filtered_feature_bc_matrix.h5 \
    https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM6157nnn/GSM6157302/suppl/GSM6157302_iMGL_CRISPRi_ci3_protospacer_calls_per_cell.csv.gz
  ```

6) GSE173316 (HyPR‑seq microglia superseries)
- Local mirror: `data/raw/human_microglia/perturbations/GSE173316/raw`
- Provenance: GEO GSE173316 HyPR‑seq superseries.
- Work orders: WO047
- Usage: HyPR‑seq panel response + CDC42 overlap.
- Reclaim: delete `data/raw/human_microglia/perturbations/GSE173316/raw`.
- Re-download:
  ```bash
  mkdir -p data/raw/human_microglia/perturbations/GSE173316/raw
  curl -L -o data/raw/human_microglia/perturbations/GSE173316/raw/GSE173316_RAW.tar \
    https://ftp.ncbi.nlm.nih.gov/geo/series/GSE173nnn/GSE173316/suppl/GSE173316_RAW.tar
  ```

7) GSE207628 (HyPR‑seq microglia reps)
- Local mirror: `data/raw/human_microglia/perturbations/GSE207628/raw`
- Provenance: GEO GSE207628 HyPR‑seq reps.
- Work orders: WO047
- Usage: HyPR‑seq panel response + CDC42 overlap.
- Reclaim: delete `data/raw/human_microglia/perturbations/GSE207628/raw`.
- Re-download:
  ```bash
  mkdir -p data/raw/human_microglia/perturbations/GSE207628/raw
  curl -L -o data/raw/human_microglia/perturbations/GSE207628/raw/GSE207628_RAW.tar \
    https://ftp.ncbi.nlm.nih.gov/geo/series/GSE207nnn/GSE207628/suppl/GSE207628_RAW.tar
  ```

### Local archives (user‑provided)

8) Zhou 2020 scRNA (GSE140511)
- Local mirror: `data/raw/human_microglia/local_archives/zhou2020/Zhou_2020.rds`
- Provenance: user‑provided archive (origin GEO GSE140511).
- Work orders: WO047
- Usage: human microglia validation registry/QC.
- Reclaim: delete the RDS and re-copy from the user archive.

9) Seahorse human microglia assays
- Local mirror: `data/raw/human_microglia/local_archives/seahorse_fig7/`
- Provenance: user‑provided archive (Seahorse assay package).
- Work orders: WO047
- Usage: alignment with metabolic/energetic phenotypes.
- Reclaim: delete the directory and re-copy from the user archive.

### References

10) CellRanger reference (GRCh38 2024‑A)
- Local mirror: `data/raw/references/refdata-gex-GRCh38-2024-A.tar.gz`
- Provenance: 10x Genomics reference bundle (GRCh38 2024‑A).
- Work orders: WO047
- Usage: CellRanger alignment for GSE178317 FASTQ processing.
- Reclaim: delete the tarball; re-download from 10x Genomics.
- Status: tarball moved to Trash; re-download with command below.
- Re-download:
  ```bash
  mkdir -p data/raw/references
  curl -L -o data/raw/references/refdata-gex-GRCh38-2024-A.tar.gz \
    https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2024-A.tar.gz
  ```

---

## Referenced but not mirrored (WO044)
These sources are cited in data maps but are not present in‑repo; see
`outputs/analysis/wo047/external_data_hash_missing.csv` for exact missing paths.

- Enrichr GO/Reactome libraries
  - Usage: WO044 module enrichment annotations.
  - Re-download:
    ```bash
    mkdir -p manuscript/orchestration/story_archaeology/external/datasets/enrichr
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/enrichr/GO_Biological_Process_2023.txt \
      "https://maayanlab.cloud/Enrichr/geneSetLibrary?mode=text&libraryName=GO_Biological_Process_2023"
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/enrichr/GO_Molecular_Function_2023.txt \
      "https://maayanlab.cloud/Enrichr/geneSetLibrary?mode=text&libraryName=GO_Molecular_Function_2023"
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/enrichr/GO_Cellular_Component_2023.txt \
      "https://maayanlab.cloud/Enrichr/geneSetLibrary?mode=text&libraryName=GO_Cellular_Component_2023"
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/enrichr/Reactome_2022.txt \
      "https://maayanlab.cloud/Enrichr/geneSetLibrary?mode=text&libraryName=Reactome_2022"
    ```
- Ensembl BioMart mouse-human orthologs
  - Usage: WO044 ortholog mapping for signaling topology replication.
  - Re-download: use Ensembl BioMart export to TSV and save as
    `manuscript/orchestration/story_archaeology/external/datasets/ensembl/biomart_mouse_human_orthologs.tsv`.
- OmniPath interactions (TSV)
  - Usage: WO044 signaling network edges.
  - Re-download:
    ```bash
    mkdir -p manuscript/orchestration/story_archaeology/external/datasets/omnipath
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/omnipath/omnipath_interactions.tsv \
      "https://omnipathdb.org/interactions?format=tsv"
    ```
- SIGNOR interactions
  - Usage: WO044 directed signaling network edges.
  - Re-download:
    ```bash
    mkdir -p manuscript/orchestration/story_archaeology/external/datasets/signor
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/signor/signor_latest.tsv \
      "https://signor.uniroma2.it/downloads/signor_latest.tsv"
    ```
- STRING v12 mouse aliases
  - Usage: WO044 STRING ID mapping.
  - Re-download:
    ```bash
    mkdir -p manuscript/orchestration/story_archaeology/external/datasets/string_v12
    curl -L -o manuscript/orchestration/story_archaeology/external/datasets/string_v12/10090.protein.aliases.v12.0.txt.gz \
      https://stringdb-static.org/download/protein.aliases.v12.0/10090.protein.aliases.v12.0.txt.gz
    ```

## Cross-system sources (WO045) — raw not mirrored
Raw external datasets used for cross-system kinematic tracking are not currently mirrored in-repo;
only derived tracking outputs live under `outputs/analysis/changes_7_8_v2/`. See
`manuscript/orchestration/story_archaeology/CROSS_SYSTEM_DATA_SCOUT.md` for sex metadata and
scout notes. Re-download into a local mirror (suggested under `data/raw/cross_system/wo045/`),
then re-run the tracking scripts in `analysis/changes_7_8_v2/`.

### Figshare (DOI -> API -> files)
```bash
python3 - <<'PY'
import json
import os
import urllib.request

dois = [
    "10.6084/m9.figshare.14445363.v1",
    "10.6084/m9.figshare.22828376",
]

for doi in dois:
    safe = doi.replace("/", "_").replace(":", "_")
    target = f"data/raw/cross_system/wo045/figshare/{safe}"
    os.makedirs(target, exist_ok=True)
    articles = json.load(urllib.request.urlopen(f"https://api.figshare.com/v2/articles?resource_doi={doi}"))
    if not articles:
        raise SystemExit(f"No figshare article found for {doi}")
    article_id = articles[0]["id"]
    files = json.load(urllib.request.urlopen(f"https://api.figshare.com/v2/articles/{article_id}/files"))
    for f in files:
        out = os.path.join(target, f["name"])
        urllib.request.urlretrieve(f["download_url"], out)
        print(out)
PY
```

### Dryad (DOI -> API -> files)
```bash
python3 - <<'PY'
import json
import os
import urllib.request

dois = [
    "10.5061/dryad.k0p2ngfg2",
    "10.5061/dryad.j6q573n9g",
    "10.5061/dryad.83bk3j9xn",
    "10.5061/dryad.m905qfv7g",
    "10.5061/dryad.69p8cz98t",
]

for doi in dois:
    safe = doi.replace("/", "_").replace(":", "_")
    target = f"data/raw/cross_system/wo045/dryad/{safe}"
    os.makedirs(target, exist_ok=True)
    dataset = json.load(urllib.request.urlopen(f"https://datadryad.org/api/v2/datasets/doi:{doi}"))
    files_url = dataset["_links"]["stash:files"]["href"]
    files = json.load(urllib.request.urlopen(files_url))
    for f in files["_embedded"]["stash:files"]:
        rel_path = f["path"].lstrip("/")
        out = os.path.join(target, rel_path)
        os.makedirs(os.path.dirname(out), exist_ok=True)
        url = f["_links"]["stash:download"]["href"]
        urllib.request.urlretrieve(url, out)
        print(out)
PY
```

### Zenodo (record API)
```bash
python3 - <<'PY'
import json
import os
import urllib.request

dois = [
    "10.5281/zenodo.11286110",
    "10.5281/zenodo.5206119",
    "10.5281/zenodo.4034929",
    "10.5281/zenodo.3484127",
    "10.5281/zenodo.15052540",
    "10.5281/zenodo.13644582",
    "10.5281/zenodo.2601562",
    "10.5281/zenodo.5206107",
    "10.5281/zenodo.5205955",
]

for doi in dois:
    record_id = int(doi.rsplit(".", 1)[-1])
    safe = doi.replace("/", "_").replace(":", "_")
    target = f"data/raw/cross_system/wo045/zenodo/{safe}"
    os.makedirs(target, exist_ok=True)
    rec = json.load(urllib.request.urlopen(f"https://zenodo.org/api/records/{record_id}"))
    for f in rec.get("files", []):
        out = os.path.join(target, f["key"])
        urllib.request.urlretrieve(f["links"]["self"], out)
        print(out)
PY
```

### GitHub
```bash
git clone https://github.com/IPMI-ICNS-UKE/Jurkat_cell_segmentation.git \
  data/raw/cross_system/wo045/github/Jurkat_cell_segmentation
```

### PLOS (supplementary movies)
```bash
mkdir -p data/raw/cross_system/wo045/plos/pone.0015129
curl -L -o data/raw/cross_system/wo045/plos/pone.0015129/pone.0015129.s001 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0015129.s001"
curl -L -o data/raw/cross_system/wo045/plos/pone.0015129/pone.0015129.s002 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0015129.s002"
curl -L -o data/raw/cross_system/wo045/plos/pone.0015129/pone.0015129.s003 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0015129.s003"
curl -L -o data/raw/cross_system/wo045/plos/pone.0015129/pone.0015129.s004 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0015129.s004"

mkdir -p data/raw/cross_system/wo045/plos/pone.0060841
curl -L -o data/raw/cross_system/wo045/plos/pone.0060841/pone.0060841.s002 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0060841.s002"
curl -L -o data/raw/cross_system/wo045/plos/pone.0060841/pone.0060841.s003 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0060841.s003"
curl -L -o data/raw/cross_system/wo045/plos/pone.0060841/pone.0060841.s004 \
  "https://journals.plos.org/plosone/article/file?type=supplementary&id=info:doi/10.1371/journal.pone.0060841.s004"
```

### Notes
- Some DOIs in the scout list (for example 10.7272/Q6NS0S5N, IEEE RC, Mendeley Data) do not expose
  stable direct file URLs; use the DOI landing page to fetch file lists when needed.

---

## Thermocausality MTCE Phases 8–31 (External Data Registry)
Generated: 2026-02-04
Scope: consolidated registry for all external datasets referenced across Phase 8–31 analyses (GEO, MetaboLights, Metabolomics Workbench, NIAGADS, Stanford PURLs, CNGB, Synapse, etc.).
Registry CSV: `phase8_31_dataset_registry.csv`
Summary:
- Total entries: 49
- GEO accessions (GSE*): 12
- Metabolomics Workbench (ST*): 22
- MetaboLights (MTBLS*): 3
Key accessions: GSE209583, GSE233208, GSE227223, GSE157827, GSE140511, GSE148822, GSE143758, GSE141044, GSE130626, GSE140399, GSE103334, STDS0000380, NG00131, MTBLS13564, ST003249
Notes: Any entry with license/restrictions = UNKNOWN requires follow-up; see `phase8_31_dataset_registry.csv` for per-dataset URLs, DOIs, and local mirror paths.

License audit pass: 2026-02-04 (unknown entries: 0).
Unknown licenses/restrictions: none