use reqwest::{Client, Error as ReqwestError};
use serde::de::DeserializeOwned;
use std::collections::HashMap;

use crate::config::ApiTubeConfig;

#[derive(Debug)]
pub enum ApiTubeError {
    RequestError(ReqwestError),
    HttpError(u16, String),
}

impl From<ReqwestError> for ApiTubeError {
    fn from(err: ReqwestError) -> Self {
        ApiTubeError::RequestError(err)
    }
}

impl std::fmt::Display for ApiTubeError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ApiTubeError::RequestError(e) => write!(f, "Request error: {}", e),
            ApiTubeError::HttpError(status, msg) => write!(f, "HTTP error {}: {}", status, msg),
        }
    }
}

impl std::error::Error for ApiTubeError {}

pub struct ApiTubeClient {
    config: ApiTubeConfig,
    http_client: Client,
}

impl ApiTubeClient {
    pub fn new(config: ApiTubeConfig) -> Result<Self, ApiTubeError> {
        let http_client = Client::builder()
            .timeout(config.timeout())
            .build()?;

        Ok(Self { config, http_client })
    }

    pub async fn request<T: DeserializeOwned>(
        &self,
        endpoint: &str,
        params: Option<HashMap<String, String>>,
    ) -> Result<T, ApiTubeError> {
        let url = format!("{}{}", self.config.base_url(), endpoint);

        let mut request = self
            .http_client
            .get(&url)
            .header("X-Api-Key", self.config.api_key());

        if let Some(params) = params {
            request = request.query(&params);
        }

        let response = request.send().await?;
        let status = response.status();

        if !status.is_success() {
            let error_text = response.text().await.unwrap_or_default();
            return Err(ApiTubeError::HttpError(status.as_u16(), error_text));
        }

        let data = response.json::<T>().await?;
        Ok(data)
    }
}
